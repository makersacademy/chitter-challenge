ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions

  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/log_in' do
    @user = User.new
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:id] = user.id
      @posts = Peep.all
      redirect ('/peeps')
    else
      flash.now[:notice] = "The password is not correct!"
      erb :log_in
    end
  end


  post '/users' do
    @user = User.new(email: params[:email], name: params[:name],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:confirm_password] )

    if @user.save
      session[:id] = @user.id
      @posts = Peep.all
      redirect ('/peeps')
    else
      flash.now[:errors]
      erb :sign_up
    end
  end

  helpers do
    def get_user_id
      @user ||= User.get(session[:id])
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = "Goodbye!"
    @posts = Peep.all
    redirect("/peeps")
  end

  post '/peep' do
    Peep.create(message: params[:user_message])
    redirect("/peeps")
  end

  get '/peeps' do
    @posts = Peep.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
