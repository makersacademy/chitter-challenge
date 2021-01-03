require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello World'
  end

  get '/chitter' do
    flash[:successful] = "You have signed up to Chitter"
    @peeps = Peep.all
    @users = User.all

    erb :'chitter/index'
  end

  post '/chitter/add' do
    Peep.create(text: params[:text], user_id: params[:current_user])

    redirect '/chitter'
  end

  get '/chitter/user' do
    erb :'chitter/user'
  end

  post '/chitter/user/new' do
    @user = User.sign_up(username: params[:username], email: params[:email])

    redirect '/chitter'
  end

  run! if app_file == $0
end
