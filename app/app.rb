ENV["RACK_ENV"] ||= "development"

require 'bcrypt'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super-secret'
  register Sinatra::Flash

  def current_user
    @current_user ||= User.get(session[:id])
  end

  get '/' do
    flash[:password] = "Passwords didn't match"
    erb :sign_up
  end

  get '/main' do
    @user = current_user
    @peeps = Peep.all
     erb :main
  end

  post '/add_peep' do
    Peep.create(message: params[:message],time: Time.now.strftime('%H:%M'))
    redirect '/main'
  end

  post '/sign_up' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:id] = user.id
    if params[:password] == params[:password_confirmation]
      redirect '/main'
    else
      redirect '/'
    end
  end
end



# run! if app_file == $0
