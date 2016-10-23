ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash

  get '/' do
    "Hello ChitterChallenge World!!!"
    redirect '/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    #Name will default to logged_in user name. It won't be editable.
    Peep.create(name: params['name'], message: params['message'] )
    redirect '/peeps'
  end

  post '/comments/new' do
    #peep.id = xxx          # Need the peep object from which the "add a comment" button was clicked.
    comment = Comment.create(message: params['comment_ta'])
    #peep.comments << comment
    # Currently the comment_peeps table is not being populated with values.
    redirect '/peeps'
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
      redirect '/peeps'
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
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/peeps'
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

    #run! if app_file == $0
end
