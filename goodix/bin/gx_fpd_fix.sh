#!/vendor/bin/sh

if [ ! -f "/data/system/users/0/fpdata/fpdb" ]
then
    touch /data/system/users/0/fpdata/fpdb
fi
chown -R system:system /data/system/users/0/fpdata
chmod -R 0777 /data/system/users/0/fpdata


if [ ! -f "/data/system/fingerprint/calibration_data" ]
then
    touch /data/system/fingerprint/calibration_data
fi
if [ ! -f "/data/system/fingerprint/gxflag" ]
then
    touch /data/system/fingerprint/gxflag
fi


if [ ! -d "/data/system/fingerprint/0_0" ]
then
    mkdir /data/system/fingerprint/0_0
fi
if [ ! -f "/data/system/fingerprint/0_0/gxfeature_table" ]
then
    touch /data/system/fingerprint/0_0/gxfeature_table
fi
if [ ! -f "/data/system/fingerprint/0_0/gxflag" ]
then
    touch /data/system/fingerprint/0_0/gxflag
fi
chown -R system:system /data/system/fingerprint
chmod -R 0777 /data/system/fingerprint
sleep 30s
chown -R system:system /data/system/fingerprint
chmod -R 0777 /data/system/fingerprint
