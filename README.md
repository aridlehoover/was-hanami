# WAS Hanami

# Weather Alert System - The Hanami Way

This is a sample Weather Alert System. `Alerts` are weather bulletins
derived from `Sources` and broadcast to `Recipients`.

The purpose of this application is to demonstrate how Clean Architecture
clarifies and isolates the business/domain logic, so that it is easier
to test, and easier to extend.

## Backlog

As an administrator,
In order to maintain the alerts in the system,
I want to...

* See a list of all alerts
* Add an alert
* See an alert
* Update an alert
* Delete an alert

As an administrator,
In order to maintain the recipients in the system,
I want to...

* See a list of all recipients
* Add an recipient
* See an recipient
* Update an recipient
* Delete an recipient

As an administrator,
In order to maintain the alert sources in the system,
I want to...

* See a list of all sources
* Add an source
* See an source
* Update an source
* Delete an source

As an administrator,
In order to rapidly notify recipients of important weather news,
I want to...

* Automatically notify all Recipients upon Alert creation if published and not expired
* Automatically notify new Recipient of latest published Alert upon Recipient creation
* Automatically notify all Recipients upon Alert publication
* Manually notify all Recipients of a specific Alert
* Manually notify a specific Recipient of the latest Alert

As an administrator,
In order to rapidly enter new alerts,
I want to...

* Import Alerts from the NWS Warnings ATOM feed
* Import Alerts from the USGS Earthquakes ATOM feed
* Import Alerts from the PTWC - Pacific Ocean Bulletins RSS feed
* Import Alerts from telemetry off a weather monitoring device via a queue
* Import Alerts from a Twitter feed

As an administrator,
In order to reach people where they are paying attention,
I want to...

* Notify Recipients via SMS
* Notify Recipients via email
* Notify Recipients via Twitter
* Notify Recipients via Facebook Messenger
* Notify Recipients via WhatsApp
* Notify Recipients via Slack
* Notify Recipients via RSS
* Notify Recipients via the web site

As an administrator,
In order to notify as many people as possible,
I want to...

* Import a CSV file containing Recipient data
* Import Recipient data from a queue
* Unsubscribe Recipient via a queue
Import a Recipient's Twitter followers accounts
Import a Recipient's Facebook Messenger contacts