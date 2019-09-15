require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/peeps'
require 'sinatra/flash'
require './lib/users'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Peeps.all
    erb :view
  end

  get '/create' do
    erb :create
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    if Users.validation(params[:email])
      if Users.user_exists(params[:username])
        Users.add(params[:name], params[:email], params[:username], params[:password])
        session[:user_id] = params[:username]
        flash[:notice] = "You have signed up for chitter - #{session[:user_id]} - you can now write your own peeps!"
      else
        flash[:notice] = 'That user already exists - please choose a different name!'
      end
    else
      flash[:notice] = 'Please enter a valid email!'
    end
    redirect '/'
  end

  post '/new' do
    Peeps.post(params[:text], Time.new, session[:user_id])
    redirect '/'
  end

  run! if app_file == $0
end
