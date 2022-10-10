require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_chitter_table
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods
  
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    
    before(:each) do
      reset_chitter_table
    end
    
    let(:app) { Application.new }

    context "GET /chitter" do
      it "returms 200 OK and gives the user a sign-up form to fill out" do
        response = get('/chitter')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h2> Please enter your details below to sign up: </h2>')
        expect(response.body).to include('<form method="post" action="/chitter">')
        expect(response.body).to include('<input type="text" name="username" placeholder="Username" />')
      end
    end

    context "POST /chitter" do
      it "should create new user and return confirmation page" do
        response = post('/chitter', username: 'david', email_address: 'david@gmail.com', password: 'toucan')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>Chitter account created! Welcome david</h1>')
        expect(response.body).to include('<p><a href="/chitter/home">david, please click here to reach the Chitter homepage and start peeping!</a></p>')
      end
    end

    context "GET /chitter/home" do
        it "returns 200 OK and list of peeps" do
            response = get('/chitter/home')

            expect(response.status).to eq(200)
            expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
            expect(response.body).to include('<div><p>1 peeps: I love games - Peeped at: 2022-05-27 13:00:01</p></div>')
            expect(response.body).to include('<form method="post" action="chitter/home">')
            expect(response.body).to include('<input type="text" name="peep" placeholder="Peep"/>')
        end
    end

    context 'POST /chitter/home' do
      xit "should create new peep that can be seen when we return to the homepage" do
          response = post('/chitter/home', content: 'I love food', time: '2021-08-12 08:09:50', user_id: '4')

          expect(response.status).to eq(200)
          
      end
    end
end

