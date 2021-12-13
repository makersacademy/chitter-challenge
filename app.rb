require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'
require './lib/sign_up'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/confirm_sign_up' do
    SignUp.create(email: params[:email], password: params[:password], user_name: params[:user_name], handle: params[:handle])
    @user_info = SignUp.all.first
    erb :confirm_sign_up
  end

  get '/log_in' do
    erb :log_in
  end

  post '/confirm_log_in' do
    if SignUp.log_in_verified?(email: params[:email], password: params[:password])
      @user_info = SignUp.all.first
      erb :confirm_log_in
    else
      erb :bad_log_in
    end
  end

  get '/user_page/:id' do
    @peeps = Peep.all
    @user_info = SignUp.all.first
    erb :user_page
    # Now we have a custom user page we want to make the user page not require the user_name and handle and instead post tweets with those autofilled. 
    # The /peep page should be custom too with /peep/:id and auto creat using the user_name and handle from user info
  end

  post '/:id/peep' do
    Peep.create(text: params[:text], user_name: params[:user_name], handle: params[:handle], time_posted: Time.new)
    redirect '/user_page/id:'
  end
end
