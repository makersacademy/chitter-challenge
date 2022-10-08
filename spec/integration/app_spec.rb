require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  peeps_seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  makers_seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(peeps_seed_sql)
  connection.exec(makers_seed_sql)
end

describe Application do
  before(:each) do 
    reset_tables
    reset_tables
  end
  
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET to /' do
    it 'returns 200 OK showing title' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter</h1>')
    end

    it 'returns list of peeps in reverse order' do
      response = get('/')
      
      maker_2_index = response.body.index('Maker: Forest')
      maker_1_index = response.body.index('Maker: Chris')
      
      expect(response.status).to eq(200)
      expect(maker_2_index < maker_1_index).to eq(true)
    end

    it 'includes Maker username' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('cast')
      expect(response.body).to include('HandsomeForest')
    end

    it 'includes Maker name' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('Chris')
      expect(response.body).to include('Forest')
    end

  end

  context 'New sign up' do
    context 'GET to /signup' do
      it "returns 200k showing title" do
        response = get('/signup')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Sign up</h3>')
      end

      it 'shows form' do
        response = get('/signup')

        expect(response.status).to eq(200)
        expect(response.body).to include('<input type="text" name="name">')
        expect(response.body).to include('<input type="text" name="username">')
        expect(response.body).to include('<input type="text" name="email">')
        expect(response.body).to include('<input type="text" name="password">')
      end
    end

    context 'POST to /signup with valid new maker' do
      it 'returns success page' do
        response = post('/signup',
        name: 'Tester',
        username: 'TesterTime',
        email: 'workplease@email.com',
        password: 'work4'
        )

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Sign up successful.</h3>')
      end
    end
    
    context 'invalid new maker, username / email exists' do
      context 'GET to /signup/failure/exists' do
        it 'returns failure page' do
          response = get('/signup/failure/exists')

          expect(response.status).to eq(200)
          expect(response.body).to include('<h3>Sign up failure. Maker already exists.</h3>')
        end
      end

      context 'POST to /signup' do
        context 'username exists' do
          it 'returns failure page' do
            response = post('/signup',
              name: 'Tester',
              username: 'cast',
              email: 'workplease@email.com',
              password: 'work4'
              )

            expect(response.status).to eq(200)
            expect(response.body).to include('<h3>Sign up failure. Maker already exists.</h3>')
          end

          context 'email exists' do
            it 'returns failure page' do
              response = post('/signup',
                name: 'Tester',
                username: 'castwe',
                email: 'cast@email.com',
                password: 'work4'
                )
  
              expect(response.status).to eq(200)
              expect(response.body).to include('<h3>Sign up failure. Maker already exists.</h3>')
            end
          end
        end
      end
    end
  end

  context 'Login' do
    context 'GET to /login' do
      it 'returns page' do
        response = get('/login')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Log in</h3>')
      end
    end

    context 'GET to /login/success' do
      it 'returns login success page' do
        response = get('/login/success')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Login successful</h3>')
      end
    end

    context 'POST to /login' do
      context 'username and password correct' do
        it 'returns login success page' do
          response = post('/login',
          username: 'cast',
          password: '123'
          )

          expect(response.status).to eq(200)
          expect(response.body).to include('<h3>Login successful</h3>')
        end
      end

      context 'GET to /login/failure' do
        it 'returns login failure page' do
          response = get('/login/failure')
  
          expect(response.status).to eq(200)
          expect(response.body).to include('<h3>Login failure. Log in details incorrect.</h3>')
        end
      end

      context 'username and password incorrect' do
        it 'returns login failure page' do
          response = post('/login',
          username: 'cast',
          password: '1234'
          )

          expect(response.status).to eq(200)
          expect(response.body).to include('<h3>Login failure. Log in details incorrect.</h3>')
        end
      end
    end
  end

  context 'Create a new peep' do
    context 'maker is not logged in' do
      xit 'returns login failure page' do
        response = get('/peep/new')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Please login or sign up first.</h3>')
        expect(response.body).to include('href="/"')
      end
    end

    context 'maker is logged in' do
      xit 'returns new peep page' do
        response = get('/peep/new')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h3>Create a new Peep</h3>')
      end
    end
  end
end
