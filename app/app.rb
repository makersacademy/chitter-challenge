
ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers'
require 'sinatra/flash'

class ChitterChatter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }
  helpers Helpers

  get '/' do
    'Hello ChitterChatter!'
    redirect to('/users/new')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  post '/users' do
    @user = User.create(email: params[:email], password: params[:password],
     password_confirmation: params[:password_confirmation])
     p @user

    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
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
    flash.keep[:notice] = 'Goodbye, thanks for sharing your view on Chitter'
    redirect to '/peeps'
  end
  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p current_user
    if !current_user
        flash.keep[:errors] = 'not logged in'
        redirect '/sessions/new'
    else
      user = current_user

      peep = Peep.create(peep_text: params[:peep_text], time: Time.now)
      p peep
      user.peeps << peep
      user.save
      redirect to '/peeps'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    @peeps.reverse
    erb :'peeps/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
