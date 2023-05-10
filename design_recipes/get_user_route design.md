# GET user/:id Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: '/user/:id'
  * any query parameters: id number of a user

## 2. Design the Response

The route might return different responses, depending on the result.

Get user route for a specific user (by its ID) will return `200 OK` if the user exists, but `404 Not Found` if the user is not found in the database.


```html
<!-- EXAMPLE -->
<!-- Response when the user is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Username</h1>
    <div>Name, email</div>
    <h3>Their peeps:</h3>
    <div>content1</div>
    <div>time</div>
    <a href="/">Back to home page</a>
  </body>
</html>
```

```html
<!-- EXAMPLE -->
<!-- Response when the user is not found: 404 Not Found -->

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>We couldn't find this user. Have a look at the <a href="/">home page</a></div>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /users/1

# Expected response:

Response for 200 OK
```

<html>
  <head>
    <title>lpc</title>
  </head>
  <body>
    <h1>lpc</h1>
    <div>Louis, lou@chitter.com</div>
    <h3>Peeps:</h3>
    <div>First post</div><br/>
    <div>- 12:00:00</div>
    <br/><br/>
    <div>Second post</div><br/>
    <div>- 13:00:00</div>
    <a href="/">Back to home page</a>
  </body>
</html>


```
# Request:

GET /users/276278

# Expected response:

Response for 404 Not Found
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /users/:id" do
    it 'returns 200 OK' do
      # Assuming the user with id 1 exists.
      response = get('/users/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>lpc</h1>')
      expect(response.body).to include('<div>First post</div><br/>')
      expect(response.body).to include('<div>Second post</div><br/>')
      expect(response.body).to include('<div>Second post</div><br/>')
    end

    it 'returns 404 Not Found' do
      response = get('/user/276278')

      expect(response.status).to eq(404)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
