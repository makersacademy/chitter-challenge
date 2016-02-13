ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'


class Chitter < Sinatra::Base
  set :sessions, true
  set :session_secret, 'super secret'

  helpers do
    def session_user
      @session_user ||= User.get(session[:user_id])
    end
  end


  get '/' do
    erb :'user/index'
  end

  post '/sign_up' do
    @new_user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = @new_user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = session_user.user_name
    erb :'user/welcome'
  end


  run! if app_file == $0
end


# register Sinatra::Flash
# register Sinatra::Partial
# use Rack::MethodOverride
# set :partial_template_engine, :erb
# enable :partial_underscores
