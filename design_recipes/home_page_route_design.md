# GET '/' Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: '/'
  * No parameters

## 2. Design the Response
 

```html
<!-- Response when the post is found: 200 OK -->

<html>
  <head>
    <title>Chitter home</title>
  </head>
  <body>
    <h1>Chitter</h1>
    <div>
      Name (username) says:
    </div>
    <div>
      peep content
    </div>
    <div>
      - 12:45
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
<html>
  <head>
    <title>Chitter home</title>
  </head>
  <body>
    <h1>Chitter</h1>
    <div>
      Name (username) says:
    </div>
    <div>
      peep content
    </div>
    <div>
      - 12:45
    </div>
  </body>
</html>

```

## 4. Encode as Tests Examples

```ruby

# file: spec/integration/app_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  
  context 'GET /' do
    it 'lists all peeps with names' do
      response = get('/')

      expect(response.status).to eq 200

      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('Louis (lpc) says:')
      expect(response.body).to include('First post')
      expect(response.body).to include('- 12:00:00')
      expect(response.body).to include('Louis (lpc) says:')
      expect(response.body).to include('Second post')
      expect(response.body).to include('- 13:00:00')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
