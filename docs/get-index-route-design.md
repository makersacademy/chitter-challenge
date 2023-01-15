# GET / Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: /

## 2. Design the Response

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <header>
      <nav>
        <a href="/login">Login here</a>
        <a href="/signup">Signup here</a>
      </nav>
    </header>
    <h1>CHITTER</h1>
    <h2>Posts</h2>
    <div>
      <p>'2023-01-08 12:05 lightnight-boy says: 'Tom Riddle is a baddie' 
      </p>
    </div>
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
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<a href="/login">Login here</a>')
      expect(response.body).to include ('<a href="/signup">Signup here</a>')
      expect(response.body).to include ("2023-01-08 12:05 lightnight-boy says: 'Tom Riddle is a baddie'")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
