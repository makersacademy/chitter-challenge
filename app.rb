require 'sinatra'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    @peep = Peep.list
    erb :index
  end

  get('/register') do
    erb :register
  end

  get('/post') do
    erb :post
  end

  post('/post') do
    Peep.post_new_peep(peep_content = params['peep'])
    redirect '/'
  end

  post('/register') do
    name = params['name']
    @@greetername = name
    username = params['username']
    email = params['email']
    password = params['password']
    User.register(name, username, email, password)
    redirect '/confirm-registration'
  end

  get('/confirm-registration') do
    erb :confirm_registration
  end

  run! if app_file == $PROGRAM_NAME

end
