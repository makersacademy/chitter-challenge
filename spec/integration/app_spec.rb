require_relative '../../app'
require "spec_helper"
require "rack/test"

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_tables
  end

  context 'GET /' do 
    it 'returns the homepage' do 
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('My third post')
      expect(response.body).to include('I am a transformer')
      expect(response.body).to include('My first post')
    end
  end

  context 'GET /signup' do 
    it 'returns the signup page' do 
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2 style='color:white'>Sign Up</h2>")
      expect(response.body).to include("<h2 style='color:white'>Sign Up</h2>")
      expect(response.body).to include('<input type="text" placeholder="Enter Fullname" name="name" required>')
    end 
  end

  context 'POST /signup' do 
    it 'creates a new user' do 
      response = post('/signup', name: 'Bobby', username: 'bobby123', email: 'bob@gmail.com', password: '1234')

      expect(response.status).to eq(302)
      user_repo = UserRepository.new 
      expect(user_repo.all.last.name).to eq('Bobby')
      expect(user_repo.all.last.username).to eq('bobby123')
    end
  end

  context 'POST /credentials_checker' do 
    it 'returns incorrect when invalid details' do 
      login = post('/credentials_checker', username: 'random', password: 'beep')
      page = get('/incorrect-details')

      expect(page.status).to eq(200)
      expect(page.body).to include('Incorrect Details!')
    end

    it 'returns valid when details are valid' do 
      login = post('/credentials_checker', username: 'Jill123', password: 'Jill')
      page = get('/logged_in')

      expect(page.status).to eq(200)
      expect(page.body).not_to include('Incorrect Details')
    end
  end

  context 'GET /logged_in' do 
    it 'returns the logged in page for that user' do 
      login = post('/credentials_checker', username: 'Jill123', password: 'Jill')
      response = get('/logged_in')

      expect(response.status).to eq(200)
      expect(response.body).to include('Jill123')
    end
  end

  context 'GET /incorrect-details' do 
    it 'returns incorrect details' do 
      page = get('/incorrect-details')

      expect(page.status).to eq(200)
      expect(page.body).to include('Incorrect Details!')
    end
  end

  context 'POST /peep/new' do 
    it 'creates a new peep' do 
      response = post('/peep/new', content: 'stuff here', time_posted: '2022-11-30 19:01:57')

      expect(response.status).to eq(302)
      
      peep_repository = PeepRepository.new 
      expect(peep_repository.all.last.content).to eq('stuff here')
    end
  end

  context 'GET /replies/:peep_id' do 
    it 'returns no replies when none there' do 
      response = get('/replies/3')

      expect(response.status).to eq(200)
      expect(response.body).to include('No replies yet')
    end
    it 'returns all the replies when there are replies present' do 
      response = get('/replies/1')

      expect(response.status).to eq(200)
      expect(response.body).not_to include('No replies yet')
    end
  end

  context 'POST /reply/:peep_id/new' do 
    it 'creates a new reply' do 
      response = post('/reply/1/new', content: 'Latest reply', time_posted: '2022-11-30 19:01:57', user_id: 1, peep_id: 1)
    
      expect(response.status).to eq(302)
      comment_repository = CommentRepository.new 
      expect(comment_repository.find_by_peep(1).last.content).to eq('Latest reply')
      expect(comment_repository.find_by_peep(1).last.peep_id).to eq('1')
    end
  end
end