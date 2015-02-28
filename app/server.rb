require 'sinatra'
require 'data_mapper'
require './app/models/peep'
require 'rack-flash'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  set :root, File.dirname(__FILE__)
  set :views, Proc.new {File.join(root, 'views')}
  set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.new(:name => params[:name],
                :username => params[:username],
                :email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
  end
end

run! if app_file == $0

end