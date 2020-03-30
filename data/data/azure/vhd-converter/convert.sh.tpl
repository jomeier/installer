#!/bin/bash

wget https://aka.ms/downloadazcopy-v10-linux -O azcopy.tar
tar xvf azcopy.tar --strip-components 1
chmod +x azcopy

wget ${vhd_url} -O fcos.vhd.xz
xz -d fcos.vhd.xz

# Upload VHD file to Azure blob storage.
./azcopy copy ./fcos.vhd '${primary_blob_endpoint}${container_name}/fcos.vhd${sas_token}'

