require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id]) unless session[:user_id].nil?
    erb :index
  end

  get '/add-peep' do
    erb :add_peep
  end

  post '/new-peep' do
    Peep.add(user_id: session[:user_id], content: params[:new_chitter_message])
    redirect('/')
  end

  get '/user/signup' do
    erb :signup
  end

  post '/user/new' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  get '/user/login' do
    erb :login
  end

  # get '/user/login/retry' do
  #   erb :login_retry
  # end

  post '/user/existing' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Invalid username or password - please try again.'
      redirect('/user/login')
    end
  end


end
