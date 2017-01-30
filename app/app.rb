ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    @user = User.new
    erb :'sign_up'
  end

  post '/registration' do
    @user= User.new(name: params[:name],
                  username: params[:username],
                  email: params[:email],
                  password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/peeps')
  else
    flash[:missing_email] = 'No email entered' if params[:email].empty?
    flash[:duplicate_email] = 'This email is already in use'
  #  session[:email] = params[:email]
    erb :'sign_up'

  end
end

  get '/peeps' do
    erb :'peeps'
  end

end


  Chitter.run! if $0 == 'app/app.rb'
