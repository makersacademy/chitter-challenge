ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative "datamapper_setup"


class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

    get '/' do
      @peeps = Peep.all.reverse
      erb :'peeps/index'
    end

    get '/peeps/new' do
      erb :'peeps/new'
    end

    post '/peeps' do
      current_user.peeps.create(content: params[:content])
      redirect to('/')
    end

    get '/users/new' do
      @user = User.new
      erb :'users/new'
    end

    post '/users' do
      @user = User.new(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/')
      else
        flash.now[:message] = 'Password and confirmation password do not match'
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
        redirect to('/')
      else
        flash.now[:message] = 'The email or password is incorrect'
        erb :'sessions/new'
      end
    end

    delete '/sessions' do
      session[:user_id] = nil
      flash.keep[:message] = 'goodbye!'
      redirect to '/'
    end


    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  run! if app_file == $0

end
