ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require "sinatra/flash"
require_relative "data_mapper_setup"
require_relative "mail_setup"

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, SecureRandom.hex(20)
  register Sinatra::Flash
  use Rack::MethodOverride

  get "/peeps/new" do
    erb :'/peeps/new'
  end

  post "/peeps" do
    peep = Peep.new(content: params[:peep],
                time: Time.now,
                user_id: session[:user_id])
    params[:tags].split.each do |tag|
      tagged_user = User.first(username: tag)
      peep.tags << Tag.first_or_create(user_id: tagged_user.id) if tagged_user
      Notification.send(tagged_user, User.get(peep.user_id))
    end
    peep.save
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all(:order => [:time.desc])
    erb :'/peeps/index'
  end

  get "/users/new" do
    erb :'/users/new'
  end

  post "/users" do
    user = User.new(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to("/peeps")
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get "/sessions/new" do
    erb :'/sessions/new'
  end

  post "/sessions" do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to("/peeps")
    else
      flash.now[:errors] = ["The username or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to("/peeps")
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
