# Sweater Weather
## Description
Sweater Weather is the back-end of a fictious road-trip planning app. The app will allow a user to see current weather as well as the future forecast for their destination.

The app is set-up to mimic a service-oriented architecture where the front-end communicates with the back-end through an API. The job of the back-end is to expose the API that satisfies the requirements laid out by the front-end team.

In order to provide the front-end with the correct information, data from multiple 3rd party APIs was aggregated into a simplified set of endpoints.

## Technology & Architecture
   * Language: Ruby 2.6.3
   * Framework: Rails 6.0.2
   * Testing: RSpec
      * VCR
      * Webmock
      * SimpleCov
   * Deployment: Heroku
   * JSON Serializer: FastJsonAPI
   * APIs:
      * Google Geocoding API
      * Google Directions API
      * DarkSky API
      * Yelp Fusion API (used on an extension, see branch `final_assessment`)
      * Unsplash API

## Testing
Sweater Weather was developed using test-driven design and has 100% coverage per SimpleCov metrics. 

## Use Sweater Weather
Sweater Weather is deployed to Heroku and accessible [here](https://sweater-weather-av.herokuapp.com/)

## Endpoints
Endpoints are built on this API URL:
`http://sweater-weather-av.herokuapp.com`

### Forecast
Retrieves the following weather details for a given city and state:
   * Location details
   * Current conditions
   * Nightly forecast
   * Hourly forecast for the next eight hours
   * Five day forecast

Endpoint:
`/forecast`

Query Parameter(s):
   * `location`, string of city and state, i.e. `denver,co`

HTTP Request Example:

`GET https://sweater-weather-av.herokuapp.com/api/v1/forecast?location=denver,co`

Response Example:
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "id": null,
            "location": "Denver, CO",
            "country": "United States",
            "current_conditions": {
                "time": 1585601495,
                "summary": "Partly Cloudy",
                "icon": "partly-cloudy-day",
                "precipProbability": 0,
                "temperature": 58.38,
                "apparentTemperature": 58.38,
                "humidity": 0.26,
                "uvIndex": 4,
                "visibility": 10
            },
            "forecast_today": {
                "summary": "Mostly cloudy throughout the day.",
                "icon": "partly-cloudy-day",
                "temperatureHigh": 58.88,
                "temperatureLow": 34,
                "summary_tonight": "Partly Cloudy"
            },
            "eight_hour_forecast": [
                {
                    "time": 1585598400,
                    "icon": "partly-cloudy-day",
                    "temperature": 57.57
                },
                {
                    "time": 1585602000,
                    "icon": "partly-cloudy-day",
                    "temperature": 58.36
                },
                {
                    "time": 1585605600,
                    "icon": "partly-cloudy-day",
                    "temperature": 56.82
                },
                {
                    "time": 1585609200,
                    "icon": "partly-cloudy-day",
                    "temperature": 56.57
                },
                {
                    "time": 1585612800,
                    "icon": "clear-day",
                    "temperature": 55.58
                },
                {
                    "time": 1585616400,
                    "icon": "clear-day",
                    "temperature": 52.81
                },
                {
                    "time": 1585620000,
                    "icon": "clear-night",
                    "temperature": 49.74
                },
                {
                    "time": 1585623600,
                    "icon": "clear-night",
                    "temperature": 47.83
                }
            ],
            "five_day_forecast": [
                {
                    "time": 1585634400,
                    "icon": "clear-day",
                    "precipProbability": 0.02,
                    "precipType": "rain",
                    "temperatureHigh": 69.56,
                    "temperatureLow": 39.91
                },
                {
                    "time": 1585720800,
                    "icon": "partly-cloudy-day",
                    "precipProbability": 0.08,
                    "precipType": "rain",
                    "temperatureHigh": 72.16,
                    "temperatureLow": 41.45
                },
                {
                    "time": 1585807200,
                    "icon": "rain",
                    "precipProbability": 0.65,
                    "precipType": "rain",
                    "temperatureHigh": 48.49,
                    "temperatureLow": 26.41
                },
                {
                    "time": 1585893600,
                    "icon": "fog",
                    "precipProbability": 0.35,
                    "precipType": "snow",
                    "temperatureHigh": 49.52,
                    "temperatureLow": 31.18
                },
                {
                    "time": 1585980000,
                    "icon": "partly-cloudy-day",
                    "precipProbability": 0.05,
                    "precipType": "snow",
                    "temperatureHigh": 62.61,
                    "temperatureLow": 36.11
                }
            ]
        }
    }
}
```
### Backgrounds
Retrieves a background image URL from Unsplash for a given city and state.

Endpoint:
`/backgrounds`

Query Parameters(s):
   * `location`, string of city and state, i.e. `denver,co`

HTTP Request Example:

`GET https://sweater-weather-av.herokuapp.com/api/v1/backgrounds?location=seattle,wa`

Response Example:
```
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "url": "https://images.unsplash.com/photo-1538097304804-2a1b932466a9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExODM3N30"
        }
    }
}
```

### Users
The users endpoints use `POST` requests to create a new user (and generate a unique API key) or authenticate an existing user.

`POST` Request Body Parameters:
   * `email`, string, must be unique
   * `password`, string
   * `password_confirmation`, string, must match password

Endpoint:
`/users`

HTTP Request Example:
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```

Response Example:
```
{
    "data": {
        "id": "7",
        "type": "user",
        "attributes": {
            "api_key": "<users-unique-api-key>"
        }
    }
}
```
The endpoint does handle errors, returning the details.

Error Example:
```
{
    "data": {
        "id": null,
        "type": "response",
        "attributes": {
            "status": 401,
            "message": "Unauthorized",
            "errors": "Email has already been taken and Password confirmation doesn't match Password"
        }
    }
}
```
### Sessions
Used to authenticate registered users to allow log-in.

Endpoint: 
`/sessions`

`POST` Request Body Parameters:
   * `email`
   * `password`
 
HTTP Request Example:
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```

Response Example:
```
{
    "data": {
        "id": "7",
        "type": "user",
        "attributes": {
            "api_key": "<users-unique-api-key>"
        }
    }
}
```
The endpoint does handle errors, returning the details.

Error Example:
```
{
    "data": {
        "id": null,
        "type": "response",
        "attributes": {
            "status": 401,
            "message": "Unauthorized",
            "errors": "Credentials are bad."
        }
    }
}
```

### Road Trip
Receives information on travel time and current forecast details upon arrival given an orgin and destination.

Endpoint:
`/road_trip`

`POST` Request Body Parameters:
   * `origin`, string of city and state, i.e. `denver,co`
   * `destination`, string of city and state, i.e. `pueblo,co`
   * `api_key`, the unique API key for a registered user
   
HTTP Request Example:
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example Response:
```
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "origin": "Denver, CO",
            "destination": "Pueblo, CO",
            "travel_time": "1 hour 48 mins",
            "arrival_forecast": {
                "summary": "Partly Cloudy",
                "temperature": 58.73
            }
        }
    }
}
```
The endpoint does handle errors, returning the details.

Error Example:
```
{
    "data": {
        "id": null,
        "type": "response",
        "attributes": {
            "status": 401,
            "message": "Unauthorized",
            "errors": null
        }
    }
}
```
