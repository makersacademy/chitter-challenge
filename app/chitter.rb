require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'dm-timestamps'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :sessions_secret, 'super secret'
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
    p Peeps.all
    @peeps = Peeps.all.sort_by{|peep| peep.created_at}
    @peeps.reverse!
    erb :'/home'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect to ('/peeps')
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
      session[:username] = user.username
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/sessions/end'
  end

  get '/sessions/end' do
    erb :'sessions/end'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user = User.first(id: session[:user_id])
    user.peepss.create(message: params[:message])
    # Peeps.create(message: params[:message], username: session[:username], time: Time.new)
    redirect to '/peeps'
  end

  post '/peeps/:id/reply' do
    puts '1'
    peep = Peeps.first(id: params[:id])
    puts 'here'
    peep.replys.create(message: params[:message], user_id: session[:user_id])
    puts 'and here'
    redirect to '/peeps'
  end

  get '/peeps/:id/reply' do
    @peep = params[:id]
    erb :'peeps/reply'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
