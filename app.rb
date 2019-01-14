ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './lib/user'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(
      name: params[:signup_name],
      username: params[:signup_username],
      email: params[:signup_email],
      password: params[:signup_password]
    )
    if user.valid?
      session[:id] = user.id
      redirect "/chitter_profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  get '/chitter_profile/:id' do
    if signed_in?
      @user = User.get(params[:id])
      @peeps = Message.all
      erb(:profile)
    else
      redirect '/'
    end
  end

  post '/peep' do
    Message.create(
      content: params[:message]
    )
    redirect "/chitter_profile/#{session[:id]}"
  end

  post '/signin' do
    user = User.authenticate(params[:signin_username], params[:signin_password])
    if user
      session[:id] = user.id
      redirect "/chitter_profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  private

    def signed_in?
      !current_user.nil?
    end

    def current_user
      @current_user ||= User.find(session[:id])
    end
end
