ENV['RACK_ENV'] ||='development'
require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash


helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

get '/' do
  @user = User.new
  erb(:homepage)
end

post '/new_user' do
  @user = User.new(name: params[:name], user_name: params[:user_name],
  email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect '/chitter'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb(:homepage)
  end
end

post '/login' do
    @user = User.authenticate(params[:login_id], params[:login_pass])
    if @user.nil?
      flash.now[:notice] = "Login Id and Password dont match"
      erb(:homepage)
    else
      session[:user_id] = @user.id
      redirect(:chitter)
    end
  end

delete '/logout' do
  session[:user_id] = nil
  flash[:notice] = 'successfully logged out'
  redirect '/'
end

post '/peep' do
  peep = Peep.create(post: params[:peep_content], time: Time.now, user_id: current_user)
  current_user.peeps << peep
  peep.save
  redirect '/chitter'
end

get '/chitter' do
  erb(:chitter)
end

end
