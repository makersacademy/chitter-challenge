ENV["RACK_ENV"] ||= "development"
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash
use Rack::MethodOverride

  get '/' do
    erb :'home'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

   get '/peeps/new' do
     erb :'peeps/new'
   end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps')
    elsif params[:password] != params[:password_confirmation]
      flash.now[:error] = "Your passwords did not match"
      erb :'/user/new'
    elsif !User.first(:email => (@user.email)).nil?
      flash.now[:error] = "Email already registered"
      erb :'/user/new'
    end
  end

  delete '/user' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect('/signout')
  end

  get '/signout' do
    erb :'signout'
  end

  get '/user/signin' do
    erb :'user/signin'
  end

  post '/user/signin' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to('/peeps')
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'user/signin'
      end
  end

  helpers do
   def current_user
    @current_user ||= User.get(session[:user_id])
   end
 end

end
