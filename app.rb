require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all.sort_by(&:time).reverse
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Incorrect log in details'
      redirect('/sessions/new')
    end
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
    flash[:notice] = 'Registration successful'
    redirect('/')
  end

  get '/registration_success' do
    erb :registration_success
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $0
end
