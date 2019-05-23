require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = User.get session[:user_id]
    @peeps = Peep.allPeepsInReverseOrder
    erb :view_peeps
  end

  post '/peep' do
    @user = User.get session[:user_id]
    Peep.create content: params[:peep_content],
                user: @user
    redirect '/'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create name: params['name'],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password]
    if user.id.nil?
      flash[:user_already_exists] = 'Those details were no good. '\
                                    'Try a bit harder.'
      redirect '/users/new'
    end
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :log_in
  end

  post '/sessions' do
    user = User.authenticate username: params[:username],
                             password: params[:password]
    if user.nil?
      flash[:login_failed] = "Sorry, we didn't recognise those details"
      redirect '/sessions/new'
    end
    session[:user_id] = user.id
    redirect '/'
  end

  delete '/sessions/delete' do
    session[:user_id] = nil
    redirect '/'
  end
end
