require 'coveralls'
require 'simplecov'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  set :public_folder, proc { File.join(root, '..', 'public') }

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'homepage'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      session[:name] = params[:name]
      session[:username] = params[:username]
      redirect to('/peeps')
    elsif
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end



  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(body: params[:body],
                    name: session[:name],
                    username: session[:username],
                    time: Time.now)
    peep.save
    redirect '/peeps'
  end

   # start the server if ruby file executed directly
 run! if app_file == $0

end


