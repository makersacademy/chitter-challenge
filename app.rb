require 'sinatra/base'
require_relative './lib/database_scripts.rb'

class Chitter < Sinatra::Base

  # enable :sessions
  use Rack::Session::Pool

  get '/' do
    session[:peeps] = getpeeps
    erb :index
  end

  get '/signup' do 
    erb :signup
  end

  get '/signin' do 
    erb :signin
  end

  post '/add_person' do
    session[:person] = add_person(
      params[:user_name],
      params[:real_name],
      params[:email],
      params[:password]
      )
    redirect '/'
  end

  post '/get_person' do
    session[:person] = get_person(params[:user_name], params[:password])
    redirect '/'
  end

  get '/add_peep' do 
    erb :add_peep
  end

  post '/added' do
    addpeep(params[:body], session[:person].user_name, session[:person].real_name)
    user_name = session[:person].user_name
    password = session[:person].password
    session[:person] = get_person(user_name, password)
    redirect '/'
  end

  get '/logout' do 
    session[:person] = nil
    redirect '/'
  end

  get '/my_peeps' do 
    erb :my_peeps
  end

  run! if app_file == $0
end
