require 'sinatra'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './lib/database_connection_setup'

class ChitterApp < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/post' do
    Peep.post(params[:name], params[:username], params[:post])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/signed_up' do
    user = User.sign_up(email: params[:email], password: params[:password],name: params[:name],username: params[:username])
    session[:user_id] = user.id
    redirect '/user_peeps'
  end

  post '/signed_in' do
    user = User.sign_in(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/user_peeps')
    else
      flash[:notice] = 'Please check your username or password.'
      redirect('/failed_sign_in')
    end
  end

  get '/failed_sign_in' do
    erb :failed_sign_in
  end

  get '/user_peeps' do
    @user = User.details(id: session[:user_id])
    @peeps = Peep.all
    erb :signed_in_peeps
  end

  run! if app_file == $0
end
