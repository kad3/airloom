airloom
=======

airloom is a customizable set of scripts with minimal dependencies for Unix-based operating systems to help you if a machine is stolen. There are a series of checks, each of which can be enabled or disabled, to determine whether the payload should be executed.

Setup
-------------
* Create an airloom user and clone the repo.
* Edit the config depending on your needs. Everything is disabled by default.
* Add a cronjob to run loom.sh.

Implemented Checks (loom.sh)
-------------
* HTTP_CHECK: checks a URL for an alert (requires curl)
* MAIL_CHECK: checks a mailbox for an alert (requires fetchmail)

Implemented Payloads (payload.sh)
-------------
* SEND_MAIL: sends an email containing the machines current public IP address (requires mailutils)
* SSH: opens a reverse SSH connection to a remote machine (requires OpenSSH)
* DEL_FILES: deletes specified files

Extras
-------------
* alert.php: very basic php script to edit a text file for the HTTP_CHECK
* ip.php / ip.pl: prints clients public IP address
* reset.sh: resets variables and kills SSH connection

TODO
-------------
* Automate setup
* Web interface to monitor status of multiple machines
* Ability to run commands remotely via email
* Public IP whitelist
* Add delay and secure deletion options to DEL_FILES
