# GET / Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method : GET
  * the path : /
  * any query parameters (passed in the URL) : NONE
  * or body parameters (passed in the request body) : NONE

## 2. Design the Response

```html
<!-- Response when the post is found: 200 OK -->

<html>
  <head><h1>CHITTER</h1></head>
  <head><h2>maker's chit chat</h2></head>
  <a href='/signup'> SIGN UP </a><br/>
  <a href='/login'> LOG IN </a><br/><br/>
  <body>
   <div>
    <p>Anna @anna123 at 2004-10-19 10:23:54</p>
    <p>I love sunshine</p>
    </div>
   <div>
    <p>John @john123 at 2004-10-19 10:00:54</p>
    <p>I like cats</p>
    </div>
  </body>
  <----->
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /

# Expected response:

Response for 200 OK

 <head><h1>CHITTER</h1></head>
  <head><h2>maker's chit chat</h2></head>
  <a href='/signup'> SIGN UP </a><br/>
  <a href='/login'> LOG IN </a><br/><br/>
  <body>
  <div>
    <p>Anna @anna123 at 2004-10-19 10:23:54</p>
    <p>I love sunshine</p>
    </div>
   <div>
    <p>John @john123 at 2004-10-19 10:00:54</p>
    <p>I like cats</p>
    </div>
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter_database_test.sql.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_tables
  end

  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /" do
    it "returns 200 and all the peeps with the name and username of their creators" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<head><h1>CHITTER</h1></head>")
      expect(response.body).to include("<head><h2>maker's chit chat</h2></head>")
      expect(response.body).to include("<a href='/signup'> SIGN UP </a><br/>")
      expect(response.body).to include("<a href='/login'> LOG IN </a><br/><br/>")
      expect(response.body).to include("<p>Anna @anna123 at 2004-10-19 10:23:54</p>")
      expect(response.body).to include("<p>I love sunshine</p>")
      expect(response.body).to include("<p>John @john123 at 2004-10-19 10:00:54</p>")
      expect(response.body).to include("<p>I like cats</p>")
      expect(response.body).to include("<div>","</div>")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.