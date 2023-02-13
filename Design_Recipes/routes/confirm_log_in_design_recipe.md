# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)
  method: POST
  path: /login
  body parameters: username, password

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when login successful: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Logged in</h1>
  </body>
  <footer>
    <a href="/">Home</a>
    <a href="/new">New Post</a>
  </footer>
</html>
```

```html
<!-- EXAMPLE -->
<!-- Response when login unsuccessful: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Login</h1>
    <div>Username or password incorrect</div>
    <form action="/login" method="POST">
    <input type="text" name ="username" placeholder="Username"></br>
    <input type="password" name="password" placeholder="Password"></br>
    <input type="submit" value="Login">
    </form>
    <a href="/signup">Sign Up</a>
  </body>
  <footer>
    <a href="/">Home</a>
  </footer>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /login

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

  context "POST /login" do
    it 'logs in correctly' do
      # Assuming the post with id 1 exists.
      response = post('/login', username: 'username3', password: 'password3')

      expect(response.status).to eq(200)
      expect(session[:user_id]).to eq 3
    end

    it 'fails to login correctly' do
      response = post('/login', username: 'username3', password: '123')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Login</h1>")
      expect(response.body).to include("<div>Password incorrect</div>")
      expect(response.body).to include('<input type="password" name="password" placeholder="Password">')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
