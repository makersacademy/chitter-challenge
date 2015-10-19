require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
    use Rack::MethodOverride


  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }

  register Sinatra::Flash


  get '/' do
    erb :'home/index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.new(content: params[:content])
    peep.user = User.first(id: session[:user_id])
    peep.time = Time.now
    peep.save
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new', layout: false
  end

  post '/users' do
    @user = User.create(name:                   params[:name],
                        username:               params[:username],
                        email:                  params[:email],
                        password:               params[:password],
                        password_confirmation:  params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
      @user = User.new
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
   session[:user_id] = nil
   flash.now[:notice] = "goodbye!"
   erb :'sessions/goodbye'
 end


  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
