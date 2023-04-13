# GET /signup Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Returns a sign up form 
  Method: GET  
  Path: /signup
  Parameters: none

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```
<!-- Response: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Sign up to Chitter!</h1>
    <form action="/signup" method="POST">
      <div><label for="username">Username:</label><input type="text" id="username" name="username"></div>
      <div><label for="name">Full Name:</label><input type="text" id="name" name="name"></div>
      <div><label for="email">E-mail:</label><input type="email" id="email" name="email"></div>
      <div><label for="password">Password:</label><input type="password" id="password" name="password"></div>
      <div><label for="confirm_password">Confirm Password:</label><input type="password" id="confirm_password" name="confirm_password"></div>
      <div><input type="submit" value="Sign up"></div>
    </form>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

# Expected response:

Response for 200 OK
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /signup" do
    it 'returns a sign up form' do
      response = get("/signup")

      expect(response.status).to eq(200)
      expect(response.body).to include "<h1>Sign up to Chitter!</h1>"
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.