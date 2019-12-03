require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  get '/test' do
    'Hello world'
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(body: params['peep'])
    redirect('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/submit-user-details' do
    User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    redirect('/signed-up')
  end

  get '/signed-up' do
    @user = User.last
    erb :confirm_signup
  end
end
