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
`docker build --rm -t publicisworldwide/jenkins-slave:custom-typo3-php56 .`

## Run (example)
`docker run -d publicisworldwide/jenkins-slave:custom-typo3-php56`
