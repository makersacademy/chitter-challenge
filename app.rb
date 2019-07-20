require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @user = User.find(id: session[:user_id])
    # @username = @user.username
    @peeps = Peep.all.sort_by(&:time).reverse
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  post '/messages' do
    Peep.create(peep: params[:message],
      time: Time.now.strftime("%m/%d/%Y %H:%M:%S"))
    redirect('/')
  end

  get '/registration' do
    erb :registration
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password], username: params[:username])
    session[:user_id] = user.id
    redirect('/registration_success')
  end

  get '/registration_success' do
    erb :registration_success
  end

  run! if app_file == $0
end
