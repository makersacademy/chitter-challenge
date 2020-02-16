require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps.rb'
require './lib/user.rb'
require 'pony'


require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps/index' do
    @user = User.find(id: session[:user_id]) 
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @user = User.find(id: session[:user_id]) 
    erb :'peeps/new'
  end

  post '/peeps/:id' do
    Peep.create(text: params[:text], user_id: params[:id])
    # p Peep.author(id: params[:id])
    body = params[:text]
    Pony.mail(:to => 'davidjohnmcgregor@gmail.com', :subject => "You've been tagged in a peep", :body => "This is the peep: #{body}", :via => :sendmail)
    redirect '/peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps/index')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps/index')
  end

  run! if app_file == $0
end