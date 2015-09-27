require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require 'sinatra/flash'


class Chitter < Sinatra::Base

    set :views, proc {File.join(root,'..','/app/views')}
    enable :sessions
    set :session_secret, 'super secret'
    register Sinatra::Flash

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end


    get '/' do
      redirect '/peeps'
    end

    get '/peeps' do
      @peeps = Peep.all
      erb :'peeps/index'
    end

    get '/peeps/new' do
      erb :'peeps/new'
    end

    post '/peeps' do
      Peep.create(message: params[:message])
      redirect ('/peeps')
    end

    get '/users/new' do
      @user = User.new
      erb :'users/new'
    end

    post '/users' do
      @user = User.create(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])

        if @user.save
          session[:user_id] = @user.id
          redirect to('/')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
        end
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


    get '/sessions/new' do
      erb :'sessions/new'
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
