ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'index'
  end

  post '/' do
    peep = Peep.create(peep_text: params[:peep_text], user_id: session[:user_id])
    if peep.save
      peep.save
      redirect to('/')
    else
      flash.now[:errors] = peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thanks for visiting. Come back soon!'
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
