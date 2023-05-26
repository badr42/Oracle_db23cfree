# NodeRed + Mosquitto Server

Terraform script that helps you provision Nodered and Mosquitto server on OCI

**NodeRed** 

Node-RED is an open-source, flow-based programming tool that enables users to create IoT applications and workflows visually. It is built on top of Node.js and provides a web-based flow editor that makes it easy to connect devices, APIs, and services. Node-RED comes with a rich set of pre-built nodes that make it easy to connect to different devices and services, including MQTT, HTTP, and WebSocket.



## Requirements

## Configuration

1. Log into cloud console 
2. Run the following 
```
git clone https://github.com/badr42/noderedOnOCI
cd noderedOnOCI
export TF_VAR_tenancy_ocid='<tenancy-ocid>'
export TF_VAR_compartment_ocid='<comparment-ocid>'
export TF_VAR_region='<home-region>'
export TF_VAR_DB_PASS=<password>


<optional>
# Select Availability Domain, zero based, if not set it defaults to 0
export TF_VAR_AD_number='0'
```

3. Execute the script generate-keys.sh to generate private key to access the instance
```
ssh-keygen -t rsa -b 2048 -N "" -f server.key
```


## Build
To build simply execute the next commands. 
```
terraform init
terraform plan
terraform apply
```


**After applying, the service will be ready in about 5 minutes** (it will install OS dependencies, as well as the packages needed to get openMPI to work)

## Post configuration
