ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'
require 'bcrypt'

class Chitter < Sinatra::Base

  enable :sessions

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.new(email: params[:email],
                    username: params[:username],
                    name: params[:name],
                    password_digest: params[:password],)

    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      redirect '/sign_up'
    end
  end

  get '/sign_in' do
    erb(:sign_in)
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      erb(:sign_in)
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
