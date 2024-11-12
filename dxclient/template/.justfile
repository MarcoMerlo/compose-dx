import '../../../.justfile'

theme-name:="MyThemeName"
theme-ear:="theme-ear.ear"
theme-xml:="theme-ear.xml"

_default:
    @just --list
    @echo
    @echo "Running on {{STS}}"

[group('_theme custom recipe')]
install-my-theme:
    @just dx-deploy-theme {{theme-name}} {{theme-ear}} {{theme-xml}}

[group('_theme custom recipe')]
update-my-theme:
    @just dx-deploy-app {{theme-name}} {{theme-ear}}
