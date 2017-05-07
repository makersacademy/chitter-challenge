ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'my secret'

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  get '/' do
    erb(:homepage)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect to('/thank-you')
  end

  get '/thank-you' do
    erb(:completed_sign_up)
  end

end
