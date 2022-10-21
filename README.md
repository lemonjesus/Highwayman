# Highwayman

This is a wip project for a web app that allows users to keep track of how much of the US Interstate system they've driven on. Ideally, once signed in, a user will be able to add completions in three ways:

* Setting a start/end position on the interstate
* Setting a start/end position anywhere, get the directions from Google, and figure out the interstate usage from there
* Uploading a GPS track and figure out the interstate usage from there

## Notes for development

To populate a database with test data (Arkansas is a small OpenStreetMap file):

docker-compose run -e DOWNLOAD_PBF=https://download.geofabrik.de/north-america/us/arkansas-latest.osm.pbf -e DOWNLOAD_POLY=https://download.geofabrik.de/north-america/us/arkansas.poly tiles import
