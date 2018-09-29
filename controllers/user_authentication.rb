require 'sinatra/base'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    @users = settings.users
    entry_hash = { name: params[:name], email: params[:email],
                   username: params[:username], password: params[:password] }
    error_message = 'Invalid sign up details, please try again'
    success_message = 'You are now signed up to Chitter!'
    if @users.create(entry_hash)
      flash[:sign_up_message] = success_message
    else
      flash[:sign_up_message] = error_message
    end
    redirect '/'
  end

  post '/log_in' do
    # Need to fix error if username or password is nil
    @users = settings.users
    if @users.sign_in(params[:username], params[:password])
      flash[:correct_sign_in?] = "You are now signed in as #{params[:username]}"
      settings.current_user.log_in(params[:username])
    else
      flash[:correct_sign_in?] = 'Incorrect login details, please try again.'
    end
    redirect '/'
  end

  post '/log_out' do
    settings.current_user.log_out
    flash[:logged_out] = 'You are now logged out.'
    redirect '/'
  end

end
