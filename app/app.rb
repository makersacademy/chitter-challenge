require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'pry'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  run! if app_file == $0
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride


  get '/' do
    erb :'welcome/index'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => :created_at.desc)

    # peeps_id = Peep.all
    # peeps_id.each do |peep|
    #   session[:peep_id] = peep.id
    # end

    erb :'peeps/index'
  end

  get '/peeps/new' do
    if current_user
      @peep = Peep.new
      erb :'peeps/new'
    else
      redirect to('/peeps')
    end
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message],
      username: current_user.username,
      name: current_user.full_name,
      user_id: current_user.id)

    if @peep.save
      session[:peep_id] = @peep.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  post '/peeps/reply' do

    comment = Comment.create(peep_reply: params[:peep_reply], peep_id: current_peep.id )

    # comments << comment
    # save
    redirect to('/peeps')

  end


  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(full_name: params[:full_name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sign_in/new' do
    erb :'sign_in/new'
  end

  post '/sign_in' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sign_in/new'
    end
  end

  delete '/sign_in' do
    session[:user_id] = nil
    flash[:notice] = 'Goodbye!'
    redirect to('/peeps')
  end

  helpers do
    def current_user
       @current_user ||= User.get(session[:user_id])
     end

     def current_peep
       @current_peep ||= Peep.get(session[:peep_id])
     end
  end

end
