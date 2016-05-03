#!/usr/bin/bash

# set the right config.properties
if [ $PRESTO_MODE == 'coordinator' ]; then
	echo Coordinator Mode selected.
	mv ./etc/config_coordinator.properties ./etc/config.properties
elif [ $PRESTO_MODE == 'worker' ]; then
	echo Worker Mode selected.
	mv ./etc/config_worker.properties ./etc/config.properties
elif [ $PRESTO_MODE == 'testing' ]; then
	echo Testing Mode selected.
	mv ./etc/config_testing.properties ./etc/config.properties
else
	echo Testing Mode as Fallback selected.
	mv ./etc/config_testing.properties ./etc/config.properties
fi 

# set the discovery.uri
echo discovery.uri=$DISCOVERY_URI >> ./etc/config.properties

# create the node.properties
echo node.environment=$NODE_ENVIRONMENT > ./etc/node.properties
echo node.data-dir=$NODE_DATA_DIR >> ./etc/node.properties
echo node.id=$(hostname) >> ./etc/node.properties

echo Starting Presto:
./bin/launcher run