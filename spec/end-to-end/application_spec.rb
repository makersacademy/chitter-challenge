require_relative "../../app"
require "spec_helper"
require "rack/test"

def reset_users_posts_table
  seed_sql = File.read('spec/schemas-tables/seeds_users_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do 
  before(:each) do 
    reset_users_posts_table
  end 
  include Rack::Test::Methods
  let(:app) { Application.new }

  it "it correctly logins in and creates post with username included" do
    response_first = post('/new_user/added',user_name:"ruben",email:"fjak@gmail.com",password:"fafjaj!") 
      
    expect(response_first.status).to eq(200)
    expect(response_first.body).to include('<p>ruben</p>')
    expect(response_first.body).to include("<h2>You've succesfully created a new acount!</h2>")

    response = post('/login', email:"fjak@gmail.com", password:"fafjaj!")
    expect(response.status).to eq(200)
    expect(response.body).to include("<h2>You've Logged in succesfully!</h2>")
    expect(response.body).to include('p>Your Logged in as:</p>')
    expect(response.body).to include('<p>ruben</p>')

    response2 = post('/post/added', content:"some content")
    expect(response2.status).to eq(200)
    expect(response2.body).to include("<h2>Post Created!</h2>")
    expect(response2.body).to include('some content')

    response3 = get('/stream')
    expect(response3.status).to eq(200)
    expect(response3.body).to include('<p>POSTED BY: ruben</p>')
    expect(response3.body).to include("<p>some content</p>")
  end 
end 