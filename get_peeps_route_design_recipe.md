# GET /peeps Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  GET /peeps

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
    <h1>Peeps</h1>

    <div>
      Username: jsmith98
      Time: 09:15:00
      Peep: Today will be a good day
    </div>

    <div>
      Username: cbacon98
      Time: 11:30:00
      Peep: I am bored who is out?
    </div>

    <!-- ... -->
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /peeps

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

  context "GET /peeps" do
    it 'returns looped list of peeps' do
      # Assuming the post with id 1 exists.
      response = get('/peeps')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Artists</h1>')
      expect(response.body).to include('Username: jsmith98')
      expect(response.body).to include('Username: cbacon98')
      expect(response.body).to include('Time: 09:15:00')
      expect(response.body).to include('Time: 11:30:00')
      expect(response.body).to include('Peep: Today will be a good day')
      expect(response.body).to include('Peep: I am bored who is out?')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

