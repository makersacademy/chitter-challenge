require 'sinatra/base'
require_relative './lib/chitter'
require_relative './lib/user'
require 'pry'

class ChitterManager < Sinatra::Base
  set :session_secret, 'super secret'
  enable :sessions

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @peeps = Chitter.all.reverse
    erb :index
  end

  post '/chitter' do
    Chitter.create(peep: params['peep'], time: Time.now)
    redirect '/chitter'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  get '/chitter/sign-up' do
    erb :'sign_up'
  end

  post '/chitter/sign-up' do
    @user = User.sign_up(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = @user.id
    redirect '/chitter'
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  run! if app_file == $0
end
