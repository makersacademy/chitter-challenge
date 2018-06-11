require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'uri'
class ChitterManager < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(email: params['email'], password: params['password'],
      name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect('/:username')
  end

  get '/:username' do
    @peeps = Peep.all
    @user = User.search(session[:user_id])
    erb(:signedin)
  end

  post '/:username/post' do
    Peep.create(content: params['content'], username: params['username'])
    redirect('/:username')
  end

  run! if app_file == $0
end
