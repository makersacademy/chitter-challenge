require 'sinatra/base'
require 'sinatra/partial'
require './app/models/user'
require 'data_mapper'
require 'dm-validations'
require './app/data_mapper_setup'
require 'rack-flash'
  

  class Chitter < Sinatra::Base
    enable :sessions
    use Rack::Flash
    use Rack::MethodOverride
    register Sinatra::Partial
    set :partial_template_engine, :erb
   


  get '/' do
    erb :index
  end
    
  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(
    :username => params[:username],
    :name => params[:name],
    :email => params[:email],
    :password => params[:password],
    :password_confirmation => params[:password_confirmation]
    )
    flash[:notice] = "Welcome, #{@user.username}!" if @user.save

    erb :index
  end


end
