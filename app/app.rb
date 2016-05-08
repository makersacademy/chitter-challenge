ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  def list_peeps 
    @peeps = Peep.all(:order => [:created_at.desc ])
    erb :index     
  end

  before do
    @user = nil
    search = User.first(:handle => session[:handle])
    if search != nil && search.email != nil 
      @user = search
    end
  end

  get '/' do
    list_peeps
  end

  post '/new' do
    begin
      fail "You must be logged in to peep" if @user == nil
      peep = Peep.create(text: params[:text], handle: @user.handle)
      peep.save
      redirect to '/'
    rescue => error
      @message = error.message
      list_peeps
    end
  end

  get '/register' do 
    erb :register
  end

  post '/new_user' do
    user = User.create(name: params[:name], email: params[:email], 
      password: params[:password], handle: params[:handle])
    begin 
      fail "Your email or handle already exists!" if user.saved? == false
      session[:handle] = user.handle
      redirect to '/'
    rescue => error
      @message = error.message
      erb :register 
    end
  end

  post '/logout' do
    session.clear
    redirect to '/'
  end

  post '/login' do
    begin
      user = User.first(:handle => params[:handle])
      fail "Don't have an account? Register below." if user == nil
      fail "Don't have an account? Register below." if user.password != params[:password]

      session[:handle] = user.handle

      redirect to '/'
    rescue => error
      @message = error.message
      list_peeps
    end
  end

  run! if app_file == $PROGRAM_NAME
end