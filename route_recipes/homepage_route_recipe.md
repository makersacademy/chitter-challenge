# {{ GET }} {{ / }} Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method - GET
  * the path - "/"
  * any query parameters (passed in the URL) N/A
  * or body parameters (passed in the request body) N/A

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<!-- register route -->
<html>
  <head></head>
  <body>
    <h1>Sign up to Chitter Chatter!</h1>
    <form method="POST" action='/register'>
    <label>Enter your email address: </label><input type="text" name="email_address" required><br>
    <label>Enter a username: </label><input type="text" name="username" required><br>
    <label>Enter a password: </label><input type="text" name="password" minlength=5 required><br>
    <input type="submit">
    </form>
  </body>
</html>

<!-- login route -->

<html>
  <head></head>
  <body>
    <h1>Enter your details</h1>
    <% if @error %>
      <div class="error">Login failed. Please try again</div>
    <% end %>
    <form method="POST" action="/login">
    <label>Enter your email address: </label><input type="text" name="email_address" required><br>
    <label>Enter your password: </label><input type="text" name="password" minlength=5 required><br>
    <input type="submit">
    </form>
  </body>
</html>

<!-- new peep route -->

<html>
  <head></head>
  <body>
    <h1>What do you want to say?</h1>
    <form method="POST" action="/new_peep">
    <label>Contents: </label><input type="text" name="contents" required><br>
    <input type="submit">
    </form>
  </body>
</html>


<!-- homepage route -->

<html>
  <head></head>
  <body>

    <% if session[:email_address] %>
    <!-- Logged in route -->
    <h1> Welcome <%= @user.username %>!</h1>
    <p>Options</p>
    <a href="/logout">Log out</a><br>
    <a href="/new_peep">Send peep</a>

    <h2>Recent Peeps</h2>
    <% @peeps.each do |peep| %>
      <div><%= peep.contents %> - <%= peep.time %></div>
    <% end %>

    <% else %>
    <!-- Not logged in route -->
    <h1>Welcome to Chitter Chatter!</h1>
    <p>Options</p>
    <a href="/login">Log in</a>
    <a href="/register">Log in</a>

    <h2>Recent Peeps</h2>
    <% @peeps.each do |peep| %>
      <div><%= peep.contents %> - <%= peep.time %></div>
    <% end %>
  <% end %>
  </body>
</html>












```


## 3. Write Examples

```
# Request: GET /
# Expected response.status: 200
# Expected response.body

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

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->