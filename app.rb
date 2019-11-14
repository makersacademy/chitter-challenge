require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/peeps'
require 'sinatra/flash'
require './lib/users'
require './lib/validation'

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
    if Validation.check_email(params[:email])
      if !Validation.check_user_exists(params[:username])
        @user = Users.add(params[:name], params[:email], params[:username], params[:password])
        session[:user_id] = params[:username]
        flash[:notice] = "You have signed up for chitter - #{@user.username} - you can now write your own peeps!"
      else
        flash[:notice] = 'That user already exists - please choose a different name!'
        redirect '/sign_up'
      end
    else
      flash[:notice] = 'Please enter a valid email!'
      redirect '/sign_up'
    end
    redirect '/'
  end

  post '/new' do
    Peeps.post(params[:text], Time.new, session[:user_id])
    redirect '/'
  end

  get '/log_out' do
    flash[:notice] = "You have logged out - #{session[:user_id]} - have a nice day!"
    session[:user_id] = nil
    redirect '/'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    if Validation.check_log_in(params[:username], params[:password])
      session[:user_id] = params[:username]
      flash[:notice] = "You have logged in - #{session[:user_id]} - welcome back!"
    else
      flash[:notice] = "Incorrect username/password - Please try again!"
      redirect '/log_in'
    end
    redirect '/'
  end

  run! if app_file == $0
end
