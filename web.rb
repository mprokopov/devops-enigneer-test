require 'sinatra'
require 'rerun'
require 'date'
require './user'
require './greeting'
require './user_repository'

UserRepository.schema

before do
  content_type :json
end

put '/hello/:username' do
  begin
    data = JSON.parse request.body.read
    raise ArgumentError.new("dateOfBirth field is not present") unless data['dateOfBirth']

    user = User.new(params['username'], data['dateOfBirth'])
    user.save

    status 204
  rescue JSON::ParserError => e
    status 500
    body "JSON input invalid"
  rescue ArgumentError => e
    status 400
    body e.message
  end
end

get '/hello/:username' do
  begin
    user = User.from_db(params['username'])
    resp = { message: Greeting.new(user).greeting }

    body(resp.to_json)
  rescue ArgumentError => e
    status 404
    body e.message
  end
end

get '/health' do
  content_type :text
  body "Ok"
end
