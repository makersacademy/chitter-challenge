require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'helpers'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] ||= :development
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "Only somewhat secret, honestly"
  data_mapper_setup

  get '/' do
    redirect '/chit' if current_user
    erb :homepage
  end

  get '/chit' do
    @name = current_user.first_name ? current_user.first_name : current_user.username
    @peeps = Peep.all
    erb :chit
  end

  post '/chit' do
    Peep.create(params)
    redirect '/chit'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(params)
    if user.save
      session[:user_id] = user.id
      redirect '/chit'
    else
      flash.next[:error] = sign_up_errors(user)
      redirect '/sign_up'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.first(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/chit'
    else
      flash.next[:error] = "Login failed. Please check your username and password."
      redirect '/sign_in'
    end
  end

  get '/sign_out' do
    session[:user_id] = nil
    redirect '/'
  end

end
