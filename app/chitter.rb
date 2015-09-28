require './app/data_mapper_setup'
require 'sinatra/partial'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  use Rack::MethodOverride

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  get '/' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors
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
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.now[:notice] = :goodbye!
    session[:user_id] = nil
    erb :'sessions/goodbye'
  end

  get '/peep/new' do
    erb :'peeps/new'
  end

  post '/' do
    posted = Time.now.strftime("%d/%m/%Y at %H:%M:%S")
    params[:posted] = posted
    peep = Peep.new(message: params[:message], posted: params[:posted], user_id: @current_user)
    peep.user = current_user
    tag = Tag.create(name: params[:tag])
    peep.tags << tag
    peep.save
    redirect to('/')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'index'
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end


  run! if app_file == Chitter
end
