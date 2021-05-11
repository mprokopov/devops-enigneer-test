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


## Requirements:
- ruby 2.x interpeter
- bundler, if necessary run `gem install bundler` to install bundler
- install dependencies using `bundle install` command

## Development
`bundle exec rake dev`

This should spin up the production web server on port `4567`

The application uses MySQL compatible database 

## Verify

Save user

```shell
curl --location --request PUT 'http://ec2-52-59-45-54.eu-central-1.compute.amazonaws.com/hello/mprokopov' \
--header 'Content-Type: application/json' \
--data-raw '{ "dateOfBirth": "1979-01-03" }'
```

Get user birthday
```shell
curl --location --request GET 'http://ec2-52-59-45-54.eu-central-1.compute.amazonaws.com/hello/mprokopov'
```

## Unit tests
Executes all tests from the tests folder

`bundle exec rake`

## Development server
Execute the following command to run development Sinatra server with automatic source reloading

`bundle exec rake dev`

## Deployment
Blue-Green deployment to the AWS EC2 instances is done using simple Ansible playbook.

Execute the following command to deploy new version.

```shell
ansible-playbook -i aws_ec2.yml playbook.yml
```

### Deployment schema:

The solution uses two nodes tagged as blue and green accordingly, database server and nginx as the webserver which points to the one of the nodes at a time.

During the deployment ansible populates env_green and env_blue groups from AWS EC2 tags using aws_ec2 plugin and whenever blue deployment is successful it checks health of api endpoint and switches the node by updating nginx configuration.

## Docker images

Application is distributed in form of docker image.  Available at DockerHub `mprokopov/devops-test-webserver`
