# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)
  
  eg
----------------------
  # Albums resource:

# List all the albums - in HTML page
Request: GET /albums
Response: list of albums

# List all the albums
Request: GET /albums
Response: list of albums

# Read a single album
Request: GET /albums/1
Response: of a single album

# Create a new album
Request: POST /albums
  With body parameters: "title=OK Computer"
Response: None (just creates the resource on the server)

# Update a single album
Request: PATCH /albums/1
  With body parameters: "title=OK Computer"
Response: None (just updates the resource on the server)

# Delete an album
Request: DELETE /albums/1
Response: None (just deletes the resource on the server)
-----------------------
# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe

returns sorted list of names
method : POST
path : /names
Query parameters:
  name (string)

  # Request:
GET /names

# Expected response (2OO OK):
Julia, Mary, Karim

returns any names given
method : GET
path : /names
Query parameters:
  name (string)


  Return a hello message
  Method : GET
  Path : /hello
  Query parameters:
    name (string)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

-- could be a result from a database or whatever

when post query param 'names' are Joe,Alice,Zoe,Julia,Kieran

--> responce status = 200

--> returns Alice,Joe,Julia,Kieran,Zoe -- as a string sorted



when query params 'names' are Julia, Mary, Karim

returns

Julia, Mary, Karim

when query param 'name' is 'Leo'

Hello Leo


<html>
  <head></head>
  <body>
    <h1>Post title</h1>
    <div>Post content</div>
  </body>
</html>
```

```html
<!-- EXAMPLE -->
<!-- Response when the post is not found: 404 Not Found -->

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>We couldn't find this post. Have a look at the homepage?</div>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:
POST "/names", names: "Joe,Alice,Zoe,Julia,Kieran"

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
code 200

# Request:
Get http://localhost:9292/names?name_1=Julia&name_2=Mary&name_3=Karim
GET /names?name=Julia, Mary, Karim

# Expected response (2OO OK):
Julia, Mary, Karim

# Request:

GET /hello?name=Leo

# Expected response:

Hello Leo!

# Request:

GET /hello?name=Josh

# Expected response:

Hello Josh!

______________
GET /posts?id=1

# Expected response:

Response for 200 OK
```

```
# Request:

GET /posts?id=276278

# Expected response:

Response for 404 Not Found
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"
ß
describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/posts?id=1')

      expect(response.status).to eq(200)
      # expect(response.body).to eq(expected_response)
    end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

```ruby
