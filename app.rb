require 'sinatra/base'
require 'pg'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require 'bcrypt'

class ChitterApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @signed_notice = session[:signed_out]
    @user = User.find(session[:user_id])
    @feed = Peep.all.reverse
    erb :feed
  end

  get '/feed/new' do
    erb :feed_new
  end

  post '/new' do
    Peep.add(content: params[:content])
    redirect '/'
  end

  get '/users/new' do
    erb :user_new
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:signed_out] = false
    redirect '/'
  end

  get '/sessions/new' do
    @alert = session[:alert]
    erb :log_in
  end

  post '/authenticate' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
    session[:user_id] = user.id
    session[:alert] = nil
    session[:signed_out] = false
    redirect('/')
    else
    session[:alert] = true
    redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    session[:signed_out] = true
    redirect('/')
  end

end
