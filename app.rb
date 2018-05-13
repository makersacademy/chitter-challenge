require 'sinatra'

require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all

    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  post '/peeps' do
    Peep.create(params['peep'])

    redirect('/peeps')
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    User.create(params['email'], params['password'], params['name'], params['username'])

    redirect('/')
  end

  post '/session' do
    username = params['username']
    password = params['password']
    if User.exists?(username) && User.correct_password?(username, password)
      session[:user] = User.select(username)

      redirect('/peeps')
    else

    end
  end

  run! if app_file == $0
end
