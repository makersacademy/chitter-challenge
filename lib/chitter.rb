require 'sinatra/base'
require './lib/data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc { File.join(root, 'views') }

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/peeps' do
    @user = User.first
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
