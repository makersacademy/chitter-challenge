require './lib/data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  include CurrentUser

  enable :sessions

  set :views, proc { File.join(root, 'views') }

  register Sinatra::Flash

  use Rack::MethodOverride

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

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = 'Goodbye!'
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    current_user.peeps.create(content: params[:content])
    redirect 'peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
