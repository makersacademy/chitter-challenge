require 'sinatra/base'
require './lib/chitter_model'

class Peeps < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end
  
  get '/register' do
    erb(:register_get)
  end

  get '/login' do
    erb(:login_get)
  end

  post '/access' do
    email = params[:email]
    password = params[:password]

    @user = Chitter.validate_user(email, password)
    erb(:access_post)
  end

  get '/view' do
    @peeps = Chitter.get_peeps
    erb(:view_peeps_get)
  end

  post '/peep' do
    @user = params[:name]
    session['user'] = @user
    session['id'] = Chitter.new_user(@user, params[:username], params[:email], params[:password])

    erb(:peep_post)
  end

  get '/peep/new' do
    @new_peep = params[:new_peep]

    erb(:new_peep_post)
  end


  run! if app_file == $0
end
