# Devops Enigneer Test
a simple "Hello World" application that exposes the following HTTP-based APIs

#### Save/update
Saves/updates the given user’s name and date of birth in the database.

Request: PUT /hello/<username> 
```json
{ "dateOfBirth": "YYYY-MM-DD" } 
```

Response: 204 No Content

Note:
<username> must contain only letters. YYYY-MM-DD must be a date before the today date.

#### Get
Returns hello birthday message for the given user 

Request: Get /hello/<username>

Response: 200 OK


Response Examples:

A. If username’s birthday is in N days:
```json
{ "message": "Hello, <username>! Your birthday is in N day(s)" }
```

B. If username’s birthday is today:

```json
{ "message": "Hello, <username>! Happy birthday!" }
```


## Install
Requirements: 
- ruby 2.x interpeter
- bundler, if necessary run `gem install bundler` to install bundler
- install dependencies using `bundle install` command

## Run
`bundle exec ruby web.rb`

This should spin up a web server on port `4567`

The application uses sqlite3 database for the sake of simplicity

## Verify

Save user

```shell
curl --location --request PUT 'http://localhost:4567/hello/mprokopov' \
--header 'Content-Type: application/json' \
--data-raw '{ "dateOfBirth": "1979-01-03" }'
```

Get user birthday
```shell
curl --location --request GET 'http://localhost:4567/hello/mprokopov'
```

## Unit tests
`bundle exec ruby tests/*`

## Deployment
Skip testing and development dependencies during installation for the deployment.

`bundle install --without test development`
