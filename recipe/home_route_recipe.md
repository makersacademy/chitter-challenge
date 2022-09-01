# GET / Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

  * the HTTP method GET
  * the path /

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Welcome to Chitter!</h1>
    <div>To see the stream of our users' peeps, please login. If you haven't yet created an account, click "Sign Up" below.</div>
  </body>
</html>
```



## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /

# Expected response:

Response for 200 OK
Includes <h1>Welcome to Chitter!</h1>
```


## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Welcome to Chitter!</h1>'
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
