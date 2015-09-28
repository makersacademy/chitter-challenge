require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash

  set :views, proc {File.join(root, '/app/views')}
  enable :sessions

  helpers do
    def current_user
      User.get(session[:user_id])
    end

    def time_format(peep)
      peep.created_at.strftime("%a, %d %b %Y %H:%M")
    end

    def create_user
      User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = create_user
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
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
      flash.now[:notice] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.now[:notice] = "Goodbye!"
    session[:user_id] = nil
    erb :'sessions/new'
  end

  get '/peeps' do
    @peeps = Peep.all(order: :id.desc)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(text: params[:text], user: current_user)
    peep.save
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
