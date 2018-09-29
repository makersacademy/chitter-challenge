require 'sinatra/base'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    @users = settings.users
    entry_hash = { name: params[:name], email: params[:email],
                   username: params[:username], password: params[:password] }
    error_message = 'Invalid sign up details, please try again'
    success_message = 'You are now signed up to Chitter!'
    already_used_message = 'Username or email already in use, please try again'

    # SHOULDNT BE ABLE TO USE EMAIL OR USERNAME ALREADY IN USE
    if @users.create(entry_hash) == 'in use'
      flash[:sign_up_message] = already_used_message
    elsif @users.create(entry_hash)
      flash[:sign_up_message] = success_message
    else
      flash[:sign_up_message] = error_message
    end
    redirect '/'
  end

  post '/log_in' do
    @users = settings.users
    if @users.sign_in(params[:username], params[:password])
      flash[:log_in_message] = "You are now signed in as #{params[:username]}"
      settings.current_user.log_in(params[:username])
    else
      flash[:log_in_message] = 'Incorrect login details, please try again.'
    end
    redirect '/'
  end

  post '/log_out' do
    settings.current_user.log_out
    flash[:logged_out] = 'You are now logged out.'
    redirect '/'
  end
end
