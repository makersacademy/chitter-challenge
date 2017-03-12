ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/helpers/db_helper'
require './lib/model'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 's3cr3t'

  get '/' do
    logged_in_user ? redirect('/feed') : erb(:index)
  end

  post '/signup_or_login' do
    redirect check_user_signup_login_details(params)
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/?logout=true'
  end

  get '/feed' do
    logged_in_user.email ? erb(:feed) : erb(:verify)
  end

  post '/post_peep' do
    post_peep(params)
    redirect '/feed'
  end

  post '/post_reply' do
    post_reply(params)
    redirect '/feed'
  end

  get '/verify' do
    erb :verify
  end

  post '/verify_account' do
    redirect verify_account(params)
  end

end
