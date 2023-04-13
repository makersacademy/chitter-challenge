# POST/signup Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Creates a new user
  Method: POST  
  Path: /signup
  Body parameters:  
    username
    name
    email
    password
    confirm_password

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

POST: /signup
```
Expected response (200 OK)
(No content)
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /signup

# Expected response:

Expected response (200 OK)
(No content)
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /signup" do
    it "creates a new user and returns 200 OK with success message" do
      response = post("/signup", username: "Delboy123", name: "Delboy Trotter", email: "delboy123@gmail.com", password: "abc123abc123", confirm_password: "abc123abc123")
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter! You have successfully registered.</h1>"
      expect(response.body).to include '<p><a href="/login">sign in here</a></p>'
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.