
## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: POST
  * the path: '/user'
  * Body parameters:
    email, password, name, username (all strings)

## 2. Design the Response

`200 OK`

```html
<!-- Response when username / email not taken: 200 OK -->
<html>
  <head></head>
  <body>
    <h1>Sign up complete!</h1>
    <div>Now you're all ready to start sharing fascinating peeps</div>
    <div>Return to the home page to make your first peep</div>
  </body>
</html>

<!-- Response when email taken: error 400 -->
<html>
  <head></head>
  <body>
    <h1>Uh oh!</h1>
    <div>Sorry, this email already exists</div>
    <div>Please try signing up again with a unique email</div>
    <div>Or return to the home page</div>
  </body>
</html>


<!-- Response when username taken: error 400 -->
<html>
  <head></head>
  <body>
    <h1>Uh oh!</h1>
    <div>Sorry, this username already exists</div>
    <div>Please try signing up again with a unique username</div>
    <div>Or return to the home page</div>
  </body>
</html>

```

## 3. Write Examples

# Request:

POST /user
parameters: 
email: email@example.com,
password: password
name: Jimmy
username: jm123

# Expected response:

Response for 200 OK
```html
erb(:user_created):
<html>
  <head></head>
  <body>
    <h1>Sign up complete!</h1>
    <div>Now you're all ready to start sharing fascinating peeps</div>
    <div>Return to the <a href="/">home page</a> to make your first peep</div>
  </body>
</html>
```

# Request
POST /user
parameters: 
email: lou@chitter.com,
password: password
name: Jimmy
username: jm123


# Expected response:

Response status 500, as email taken:
body
<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>Your email is already taken</div>
    <div>Please try <a href="/new_user">signing up</a> again with a unique email</div>
    <div>Or return to the <a href="/">home page</a></div>
  </body>
</html>

# Request
POST /user
parameters: 
email: email@example.com,
password: password
name: Jimmy
username: lpc

# Expected response:

Response status 500, as username taken:
body
<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>Your username is already taken</div>
    <div>Please try <a href="/new_user">signing up</a> again with a unique username</div>
    <div>Or return to the <a href="/">home page</a></div>
  </body>
</html>


## 4. Encode as Tests Examples

```ruby

# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /user" do
    it 'returns 200 OK with valid email and username' do
      response = post(
        '/user',
        email: 'email@example.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Sign up complete!</h1>')
    end

    it 'returns 500 when email taken' do
      response = post(
        '/user',
        email: 'lou@chitter.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(500)
      expect(response.body).to include('<div>Your email is already taken</div>')
    end

    it 'returns 500 when username taken' do
      response = post(
        '/user',
        email: 'lou@chitter.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(500)
      expect(response.body).to include('<div>Your username is already taken</div>')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.