require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'erb'
require 'timecop'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_chitter_database_test
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_database_test
  end

  context 'GET /' do
    it "should display peeps in reverse chronological order in the homepage" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<section>')
      expect(response.body).to include('2023-04-10 15:12:00')
      expect(response.body).to include('new peep!')
      expect(response.body).to include('2023-04-09 19:10:00')
      expect(response.body).to include('peep 1')
      expect(response.body).to include('2023-04-09 19:05:00')
      expect(response.body).to include('peep peep 2')
      expect(response.body).to include('</section>')
      
    end

    it "should get the form to add a new peep" do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/post">')
      expect(response.body).to include('<input type="text" name="message">')
      expect(response.body).to include('<input type="submit">')
    end

  end

  context 'POST /post' do
    it "escapes any HTML tags in the input, and returns the sanitized input" do

      response = post('/post', 
        message: '<script>document.location.href="https://www.youtube.com/watch?v=34Ig3X59_qA";</script>')
      expect(response.status).to eq(302)

      
      response = get('/')
      expect(response.body).to include('&lt;script&gt;document.location.href=&quot;https://www.youtube.com/watch?v=34Ig3X59_qA&quot;;&lt;/script&gt;')
    end

    it "creates a peep with information about the time it was created" do
      Timecop.freeze(Time.utc(2023, 4, 10, 22, 25, 0)) do
    
        post('/post', message: 'peep sounds funny')
  
        response = get('/')
        expect(response.body).to include('2023-04-10 22:25:00')
        expect(response.body).to include('peep sounds funny')
      end

    end

    it "redirects to homepage" do
      response = post('/post')
      expect(response.status).to eq(302)
    end

  end

  
end