Chitter Route Design Recipe

# 1. Design the Route Signature

  * the HTTP method
  * the path

  Method: GET
  Path: /messages

# 2. Design the Response

```
Date
Message
Handle

Date
Message
Handle
```

# 3. Encode as Tests Examples

```ruby
file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'should return the list of messages' do
      # Assuming the post with id 1 exists.
      response = get('/')
      expected_response = "<html><body><h1>Welcome to Chitter</h1></body></html>"
      expect(response.status).to eq(200)
      expect(response.body).to include(expected_response)
    end
  end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end
  
  context "POST /" do
    it 'posts a new message' do
      response = post('/?message=Will join you for a walk!&id=3') 

      expect(response.status).to eq(200)
      expect(response.body).to eq('')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
