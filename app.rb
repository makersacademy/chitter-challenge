require 'sinatra/base'
require './lib/chitter'
require './lib/user'
require 'pry'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/chitter' do
    # @user = session[:user_id]
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    @peeps = Chitter.all_peeps
    erb(:index)
  end

  get '/chitter/new' do
    erb(:new)
  end
# I am not sure whether this routing is right:
  post '/chitter/save_new' do
    Chitter.create(params[:user_id], params[:content])
    redirect('/chitter')
  end

  get '/chitter/signup' do
    erb(:signup)
  end
# I am not sure whether this routing is right:
  post '/chitter/save_new_user' do
    user = User.create(params[:first_name], params[:last_name], params[:email], params[:username])
    session[:user_id] = user.user_id
    redirect('/chitter')
  end

  run! if app_file == $0

end
