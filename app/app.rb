ENV['RACK_ENV'] ||= 'development'

require_relative 'dm_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :sign_up
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peep/new' do
    erb :new_peep
  end

  post '/peep/new' do
    Peep.create(message: params[:message], created_at: DateTime.now)
    redirect '/peeps'
  end

  post '/sign_up' do
    @current_user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password],
    password_confirmation: params[:confirmation_password])
    flash[:wrong_password] = "Password and confirmation password do not match" if @current_user.id.nil?
    flash[:repeat_email] = @current_user.errors[:email].join(" ")
    session[:user_email] = @current_user.email
    session[:user_id] = @current_user.id
    redirect '/' if @current_user.id.nil?
    redirect '/peeps'
  end
end
