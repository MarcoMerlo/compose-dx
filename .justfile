set allow-duplicate-recipes
# variables
WPCTX:='wps'
STS_SUFFIX:='-core'
STS:=(env_var_or_default('STS_NAME',env_var('COMPOSE_PROJECT_NAME')) + STS_SUFFIX)

zip-props:='props-tmp.zip'

# Pages releases
pages-release:='20231110'

_default:
    @just --list
    @echo
    @echo "Running on {{STS}}"

# Restart current StatefulSet and propmts its status
[group('OpenShift')]
oc-restart:
    @echo "Restarting {{STS}}"
    oc rollout restart sts {{STS}}
    oc rollout status sts {{STS}}

# Show current StatefulSet system out logs
[group('OpenShift')]
oc-logs:
    oc get pods
    oc logs -f {{STS}}-0 -c system-out-log


# Hidden recipe to effectively deploy pages from a release
_dx-deploy-pages cwd release pages:
    @echo "Deployng page-set:{{pages}} - release:{{release}} - from: {{cwd}}"
    @cd {{cwd}} && dxclient.sh xmlaccess -xmlConfigPath /{{WPCTX}}/config/${DXPROJECT} \
     -xmlFile /dxclient/store/xmlaccess_overlay/uebav2/{{release}}/{{pages}}.xml


# Updates a single Resource Environment Provider for current StatefulSet
[no-cd]
[group('DX REP')]
dx-import-property propertyFile:
    @echo "From {{STS}} - importing $(pwd)/properties/{{propertyFile}}"
    @cd ./properties && rm -f {{zip-props}} && zip {{zip-props}} "{{propertyFile}}"
    @just _dx-import-zip-properties $(pwd) {{zip-props}}

# Results are stored in 'outputFiles' folder
[no-cd]
[group('DX REP')]
dx-export-properties:
    @echo "From {{STS}} - exporting properties"
    dxclient.sh resource-env-provider export-properties

# Import all given Resource Environment Providers values for current StatefulSet
[no-cd]
[group('DX REP')]
dx-import-properties:
    @echo "Preparing Resource Environment Providers properties for {{STS}}"
    @cd ./properties && rm -f {{zip-props}} && zip {{zip-props}} *.properties
    @just _dx-import-zip-properties $(pwd) {{zip-props}}

# Hidden recipe to effectively deploy properties from zip file
_dx-import-zip-properties cwd zip:
    @echo "From {{cwd}}"
    @echo "Importing zipped properties: {{zip}}"
    @-cd {{cwd}} && \
      dxclient.sh resource-env-provider import-properties \
        --filePath /dxclient/store/properties/{{zip}}
    @echo "Cleanup properties"
    @rm -f {{cwd}}/properties/{{zip}}

# Deploy an ear app con currente StatefulSet
[no-cd]
[group('DX APP')]
dx-deploy-app name file:
    @echo "$(pwd)"
    @echo "{{STS}} - application {{name}} - {{file}}"
    dxclient.sh deploy-application \
      -applicationName {{name}} \
      -applicationFile /dxclient/store/artifacts/{{file}}

# Install theme on current StatefulSet
[no-cd]
[group('DX APP')]
dx-deploy-theme themeName themeFile registerFile:
    @echo "{{STS}} - theme {{themeName}} - {{themeFile}} - {{registerFile}}"
    dxclient.sh deploy-theme \
      -applicationName {{themeName}} \
      -applicationFile /dxclient/store/artifacts/{{themeFile}} \
      -xmlFile /dxclient/store/xmlaccess/{{registerFile}}

# Deploy admin pages on current StatefulSet
[group('DX PAGES')]
dx-deploy-pages-admin release=(pages-release):
    @just _dx-deploy-pages {{invocation_directory()}} {{release}} "ueba-admin"

# Deploy delivery pages on current StatefulSet
[group('DX PAGES')]
dx-deploy-pages-delivery release=(pages-release):
    @just _dx-deploy-pages {{invocation_directory()}} {{release}} "ueba-delivery"

# Deploy release pages on current StatefulSet
[group('DX PAGES')]
dx-deploy-pages-authoring release=(pages-release):
    @just _dx-deploy-pages {{invocation_directory()}} {{release}} "ueba-authoring"

# Restart core pods
[no-cd]
[group('Env')]
dx-restart:
    @echo "Resarting pods for {{STS}}"
    dxclient.sh restart-core-pods -h

# Clean logs and output files from current context
[no-cd]
[group('Env')]
clean:
    rm -rf logs outputFiles artifacts xmlaccess

# Creates a new environment directory to work on given StatefulSet name
[group('Env')]
init sts-name:
    @mkdir -p "${WRK_ENVS}/{{sts-name}}"
    @just _env_init {{sts-name}}
    @cp -r dxclient/template/* "${WRK_ENVS}/{{sts-name}}"
    @echo "Env created at: ${WRK_ENVS}/{{sts-name}}"

_env_init sts-name:
    #!/bin/bash
    echo "source_up
    export STS_NAME={{sts-name}}
    echo
    echo \">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\"
    echo \"[working-env] StatefulSet STS_NAME: \$STS_NAME\"
    echo" > ${WRK_ENVS}/{{sts-name}}/.envrc
    chmod a+x ${WRK_ENVS}/{{sts-name}}/.envrc

# Show compose log
[group('Docker Compose')]
compose-log:
    docker-compose logs -f

# Restart a cointainer or the complete compose set
[group('Docker Compose')]
compose-restart container='':
    docker-compose restart {{container}}

[group('Docker Compose')]
compose-down:
    docker-compose down

[group('Docker Compose')]
compose-up:
    docker-compose up -d --remove-orphans

# [no-cd]
# Show current StatefulSet or compose name
[group('Stats')]
current-info:
    @echo "currend StatefulSet {{STS}}"
    @echo "currend dir $(pwd)"
    @echo "invoke dir {{invocation_directory()}}"


#  \
#    deploy-scriptapplication push \
#      -wcmSiteArea "Script Application Library/Script Applications" \
#      -wcmContentName "EducSampleScriptApp01" \
#      -wcmContentTitle "My Title" \
#      -mainHtmlFile index.html \
#      -contentRoot "/dxclient/store/out"