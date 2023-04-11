# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

[x] Page: homepage
Request: GET / (peep_repo.all)
No parameters
Response (200 OK)
index view with list of peeps, login status, link to log in/out, links to sign up and create peep

[ ] Page: create new peep
Request: GET /peeps/new
No parameters
Response (200 OK)
new_peep view with form to create new peep

[ ] Page: new peep created (peep_repo.create(new_peep))
Request: POST /peeps
Parameters: name, username, time, content
Response (200 OK)
new_peep_success view with link to homepage

[x] Page: signup
Request: GET /signup
No parameters
Response (200 OK)
signup view with form to create a new user

[x] Page: signup successful (user_repo.create(new_user))
Request: POST /signup
Parameters: name, email, username, password
Response (200 OK)
signup success view with link to login

[x] Page: log in
Request: GET /login
No parameters
Response (200 OK)
login view with form to log in

[x] Page: log in successful (user_repo.find_by_email(email))
Request: POST /login
Parameters: email, password
Response (200 OK)
login success view with link to homepage

[ ] Page: log out
Request: GET /logout
No parameters
Response (200 OK)
logout view with button to log out

[ ] Page: log out successful
Request: POST /logout
Parameters: user_id?
Response (200 OK)
Redirect to homepage

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

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
