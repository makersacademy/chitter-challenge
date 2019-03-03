require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user])
    erb :'peeps/view_peeps'
  end

  post '/users' do
    user = User.create(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], email: params[:email], password: params[:password])
    session[:user] = user.id
    redirect('/peeps')
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], time: Time.now)
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    @user = User.find(id: session[:user])
    Peep.create(body: params[:body], username: @user.username, created_at: Time.now, user_id: @user.id)
    redirect('/peeps')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You are signed out"
    redirect('/')
  end

  get '/sessions/new' do
    erb :'users/sign_in'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect('/peeps')
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep], time: params[:time])
    redirect('/peeps')
  end

  post '/sessions' do
    user = User.first(:email => params[:email])
    if user == nil
      flash[:notice] = 'Email address not recognised.'
      redirect('/sessions/new')
    elsif BCrypt::Password.new(user.password) == params[:password] && user
      session[:user] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect password.'
      redirect('/sessions/new')
    end
  end

run! if app_file == $0
end
