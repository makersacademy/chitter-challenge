require 'sinatra'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/post' do
    Peep.post(params[:name], params[:username], params[:post])
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/signed_up' do
    user = User.sign_up(email: params[:email], password: params[:password],name: params[:name],username: params[:username])
    session[:user_id] = user.id
    redirect '/user_peeps'
  end

  get '/user_peeps' do
    @user = User.details(id: session[:user_id])
    @peeps = Peep.all
    erb :signed_in_peeps
  end

  run! if app_file == $0
end
