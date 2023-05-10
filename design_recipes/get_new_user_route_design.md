
## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: '/new_user'
  * no parameters

## 2. Design the Response

`200 OK`

```html
<!-- Response when the post is found: 200 OK -->
Form for creating a new user:
<html>
  <head>
    <title>Sign up!</title>
  </head>
  <body>
    <h1>Welcome to Chitter!</h1>
    <h2>Fill in your details to sign up:</h2>
    <form method="POST" action="/user">
      <div>
        <label>Email</label>
        <input type="text" name="email">
      </div>
      <div>
        <label>Password</label>
        <input type="text" name="password">
      </div>
      <div>
        <label>Display name</label>
        <input type="text" name="name">
      </div>
      <div>
        <label>Username</label>
        <input type="text" name="username">
      </div>
      <input type="submit">
    </form>
  </body>
</html>
```

## 3. Write Examples

```
# Request:

GET /new_user
parameters: none

# Expected response:

Response for 200 OK

erb(:new_user)

## 4. Encode as Tests Examples

```ruby

# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /new_user" do
    it 'returns 200 OK with the sign up form' do
      response = get('/new_user')

      expect(response.status).to eq(200)

      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<form method="POST" action="/user">')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.