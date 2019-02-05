# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'

# the controller
class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/in' do
    erb :in
  end

  post '/sign_in' do
    email = params[:email]
    password = params[:password]
    if User.sign_in_check(email, password) != true
      flash[:sign_in] = 'email or password incorrect'
      redirect '/in'
    else
      User.sign_in(email)
      redirect '/signed_in'
    end
  end

  get '/up' do
    erb :up
  end

  post '/sign_up' do
    username = params[:username]
    name = params[:name]
    email = params[:email]
    password = params[:password]
    repassword = params[:repassword]
    if username == '' || name == '' || email == '' || password == ''
      flash[:sign_up] = 'all fields are required'
      redirect '/up'
    elsif User.email_check(email) != true
      flash[:sign_up] = 'there is already an account with that email'
      redirect '/up'
    elsif User.username_check(username) != true
      flash[:sign_up] = 'that username is already taken'
      redirect '/up'
    elsif User.password_check(password, repassword) != true
      flash[:sign_up] = 'those passwords do not match'
      redirect '/up'
    else
      User.create(username, name, email, password)
      User.sign_in(email)
      redirect '/signed_in'
    end
  end

  get '/signed_in' do
    @peeps = Peep.all
    erb :signed_in
  end

  post '/post_peep' do
    user_id = User.user_id
    username = User.username
    content = params[:content]
    if content == ''
      redirect '/signed_in'
    elsif user_id.zero?
      redirect '/'
    else
      Peep.post_peep(user_id, username, content)
      redirect '/signed_in'
    end
  end

  get '/out' do
    User.sign_out
    redirect '/'
  end
end
