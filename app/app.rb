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
    @user = User.new
    erb :sign_up
  end

  get '/sign_up_missed' do
    @user = User.first
    erb :sign_up
  end

  get '/sessions/new' do
    erb :session_new
  end

  get '/main' do
    @user = current_user
    @peeps = Peep.all
     erb :main
  end

  post '/add_peep' do
    Peep.create(message: params[:message], time: Time.now.strftime('%H:%M'))
    redirect '/main'
  end

  post '/sign_up' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/main'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/sign_up_missed'
    end
  end
end



# run! if app_file == $0
