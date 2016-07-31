require 'data_mapper'
ENV['RACK_ENV'] ||= "development"
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_development")


require_relative './models/user'
require_relative './models/peep'
require 'sinatra/flash'
require 'sinatra/base'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb:index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
  @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/'
      else
        flash.now[:bad] = "There was a problem with your sign up, Wanna try again?"
        erb :'/user/new'
      end
    end

    get '/sessions/new' do
      erb :'sessions/new'
    end

    post '/sessions' do
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.now[:errors] = "The email or password is incorrect"
        erb :'sessions/new'
      end
    end

    delete '/sessions' do
      session[:user_id] = nil
      flash.keep[:notice] = 'TTYN'
      redirect to '/'
    end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep' do
    Peep.create(post: params[:peep],
              author: params[:current_user],
              time: params[Time.now])
    redirect '/peep/list'
  end

  get '/peep/list' do
    @peeps = Peep.all
    erb :'peep/list'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
