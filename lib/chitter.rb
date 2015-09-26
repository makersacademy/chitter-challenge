require './lib/data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions

  set :views, proc { File.join(root, 'views') }

  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      redirect '/peeps'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/users/new'
    end
  end

  get '/peeps' do
    @user = User.first
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
