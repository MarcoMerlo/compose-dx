## config.json

This templated file is an example configuration to allow
connections to localhost on default ports
through compose execution via makefile

    make up / make run / make start-cw-profile

Provided by wp_profile

    - 10039 default dx http listener         
    - 10042 default dx https listener
    - 10038 wp admin console http listener      *
    - 10041 wp admin console https listener     

Provided by cw_profile (must be started manually or with makefile)

    - 10200 config wizard (dx-connect) http listener
    - 10202 config wizard (dx-connect) https listener   
    - 10201 cw admin console http listener      *
    - 10203 cw admin console https listener

Ports with `*` are not exposed, reported for documentation only.
