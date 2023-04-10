# GET /peeps/new Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Returns a form to create a new peep 
  Method: GET  
  Path: /peeps/new 
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
    <h1>Create a new peep</h1>
    <form action="/peeps/new" method="POST">
      <div><label for="peep">Peep:</label></div>
      <div><textarea id="peep" name="peep" rows="10" cols="50"></textarea></div>
      <div><input type="submit" value="Submit Peep"></div>
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

  context "GET /peeps/new" do
    it 'returns a form to create a new peep' do
      response = get("/peeps/new")

      expect(response.status).to eq(200)
      expect(response.body).to include "<h1>Create a new peep</h1>"
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.