require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

get '/' do
  erb :index
end

post '/peeps' do
  session[:user] = params[:user]
  session[:peep] = params[:peep]
  redirect '/peeps/new'
end

get '/peeps/new' do
  @user = session[:user]
  @peep = session[:peep]
  erb :peeps_new
end

run! if app_file == $0
end
