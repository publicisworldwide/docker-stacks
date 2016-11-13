# Jenkins Slave based on Oracle Linux (PHP/TYPO3 adjusted) 

This Dockerfile provide the following services:

* build tools:
  * Compass (http://compass-style.org/)
  * Node.js (https://nodejs.org/)  
    pre-installed grunt-cli and karma-cli 

* acceptance test tools
  * Firefox
  * PhantomJS
  * Selenium

* web environment
  * apache
  * mysql
  * php 5.6 (apache module)

## Build (example)
`docker build --rm -t ppkoeln/typo3:1.0 .`

## Run (example)
`docker run -d --security-opt seccomp=unconfined --stop-signal=SIGRTMIN+3 --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -t ppkoeln/typo3:1.0`
