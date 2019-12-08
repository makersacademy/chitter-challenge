require 'sinatra/base'

require_relative 'models/peep.rb'
require_relative 'models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find_by(id: session[:id])
    @peeps = Peep.all.order created_at: :desc
    @message = session.delete(:message)
    erb :index
  end

  post '/peeps/new' do
    Peep.create(user_id: 1, content: params[:peep_text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username],
                       password: params[:password], email: params[:email])
    if user.id.nil?
      session[:message] = "This username or email is already registered, sorry."
    else
      session[:id] = user.id
    end
    redirect '/peeps' 
  end

  get '/logout' do
    session.delete(:id)
    redirect '/peeps'
  end

  get '/login' do
    @message = session[:message]
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/peeps'
    else
      session[:message] = "Username or password incorrect."
      redirect '/login'
    end
  end
end 
