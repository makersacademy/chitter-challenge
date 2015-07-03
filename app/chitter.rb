require 'sinatra/base'
require_relative '../datamapper_setup.rb'
require_relative './models/user'

class App < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  
  get '/' do
  	@user = User.new
    'Hello App!'
  end

  post '/users' do
  	@user = User.new(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
  	@user.save

    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
