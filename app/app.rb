require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'
require './app/helpers/user_helper.rb'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  include UserHelper
  run! if app_file == $PROGRAM_NAME

  use Rack::MethodOverride

  register Sinatra::Flash

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  set :views, proc { File.join(root, 'views') }

  enable :sessions
  set :session_secret, 'super secret'

  # 0 Seeing peeps

  # Amend this so that only the user can post.
  post '/peeps' do
    peep = Peep.create(peep: params[:peep])
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end


  # 1. Registering
  get '/' do
    erb :index
  end

  post '/user/sign-up' do
    #we initialize the object without saving it.
    @user = User.create(email: params[:email], password: params[:password],
    name: params[:name], username: params[:username])
    if @user.save #return true or false if successfuly saved
      session[:user_id] = @user.id
      redirect :'/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :index
    end
  end

  # 2. Log in
  post '/user/login' do
    user = User.login(params[:user], params[:login_password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash[:errors] = ['The username or password is incorrect']
      redirect to '/'
    end
  end

  # 3. Sign out
  delete '/user/login' do
    flash.next[:notice] = "Goodbye #{current_user.name}"
    session[:user_id] = nil
    redirect to '/peeps'
  end
end
