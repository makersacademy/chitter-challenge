require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/users'

class ChitterApp < Sinatra::Base
  use Rack::Session::Pool

  register Sinatra::Flash

  configure do
    set :users, Users.new
  end

  # not_found do
  #   status 404
  #   erb :'404Page'
  # end

  get '/' do
    erb :index
  end

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

  post '/sign_in' do
    @users = settings.users
    if @users.sign_in(params[:username], params[:password])
      flash[:correct_sign_in?] = "You are now signed in as #{params[:username]}"
      # Need to add a current user object to hold the signed in user
    else
      flash[:correct_sign_in?] = 'Incorrect login details, please try again.'
    end 
  end

  run! if app_file == $0
end
