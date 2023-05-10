
## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: '/new_user'
  * no parameters

## 2. Design the Response

`200 OK` as long as the username has been created
`400` if username does not exist

```html
<!-- Response when the post is found: 200 OK -->

The home page body - erb(:home)
```

```html
<!-- EXAMPLE -->
<!-- Response when the post error (no username): 400 -->

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>This username does not exist...</div>
    <div>Please sign up first</div>
    <div>Or return to the home page</div>
  </body>
</html>
```

## 3. Write Examples

```
# Request:

POST /peep
parameters:
content: "This is a new post"
username: "lpc"

# Expected response:

Response for 200 OK
body erb(:home)
```
# Request:

POST /peep
parameters:
content: "This is a new post"
username: "unknown"

# Expected response:

Response for 400 (No such user):

<html>
  <head></head>
  <body>
    <h1>Sorry!</h1>
    <div>This username does not exist...</div>
    <div>Please sign up first</div>
    <div>Or return to the home page</div>
  </body>
</html>

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /peep" do
    it 'returns 200 OK with valid username' do
      # Assuming the username already exisis
      response = post(
        '/peep',
        content: "New peep posted",
        username: "lpc"
      )

      expect(response.status).to eq(200)
      expect(response.body).to include(<div>Louis (lpc) says:</div>)
      expect(response.body).to include(<div>New peep posted</div>)
    end

    it 'returns 400 with invalid username' do
      response = post(
        '/peep',
        content: "New peep posted",
        username: "unknown"
      )

      expect(response.status).to eq 400
      expect(response.body).to include('<div>This username does not exist...</div>')
      expect(response.body).to include('<div>Please sign up first</div>')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.