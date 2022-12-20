# Highway Man

This is a wip project for a web app that allows users to keep track of how much of the US Interstate system they've driven on. Ideally, once signed in, a user will be able to add completions in two ways:

* Setting a start/end position anywhere, get the directions from Google, and figure out the interstate usage from there
* Uploading a GPS track and figure out the interstate usage from there

The user can see (and potentially render on a map) all of their completions, and see stats about how much of the system they've driven on. This only applies to the US Interstate system, not the entire US highway system. Although I suppose it could be extended to the entire US highway system, however that isn't in scope for this project.

## Proposed API
### POST `/api/v1/authenticate`
Authenticates a user. I want this to be federated, maybe using Google. I'm not sure how to do that yet.

### POST `/api/v1/me`
Returns the current user's information.

### POST `/api/v1/rangeToLines`
Takes a start and end point, gets the route from Google, and figures out and returns the corresponding highway lines that are part of the route.

### POST `/api/v1/fileToLines`
Given a GPS track file, returns the corresponding highway lines that are part of the route.

### `POST /api/v1/lines`
Save one or more lines to the database for a user.

### GET `/api/v1/lines`
Gets all lines for a user. You can filter this in several ways:
  - `?start=2018-01-01` - only lines that started after this date
  - `?end=2018-01-01` - only lines that ended before this date

### GET `/api/v1/lines/:id`
Gets a single line by id.

### DELETE `/api/v1/lines/:id`
Deletes a single line by id.

### GET `/api/v1/stats`
Gets stats for a user.

## Notes for development

To populate a database with test data (Arkansas is a small OpenStreetMap file):

```
docker-compose run -e DOWNLOAD_PBF=https://download.geofabrik.de/north-america/us/arkansas-latest.osm.pbf -e DOWNLOAD_POLY=https://download.geofabrik.de/north-america/us/arkansas.poly tiles import
```
