require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/helpers/current_user'


class Chitter < Sinatra::Base

  include CurrentUser

  enable :sessions
  
  register Sinatra::Flash
  set :session_secret, 'super secret'

  set :static, true
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public'
  set :views, proc {File.join(root, '..', 'app/views')}

  get '/' do

    @peeps = Peep.all.reverse
    erb(:'index')
  end

  get '/users/sign_up' do
    erb(:"users/sign_up")
  end

  post '/users/sign_up' do
    if params[:password] != params[:password_confirmation]
      flash.now[:errors] = []
      flash.now[:errors] << "Your passwords didn't match. Try again."
      erb(:"users/sign_up")
    else
      user = User.new(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password])
      if user.save
        session[:user_id] = user.id
        redirect("/")
      else
        flash.now[:errors] = user.errors.full_messages
        erb(:"users/sign_up")
      end
    end
  end

  get '/users/sign_in' do
    erb(:"users/sign_in")
  end

  post '/users/sign_in' do
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:loginerror] = "Those login details are incorrect."
      erb(:"users/sign_in")
    end
  end

  get '/users/sign_out' do
    session[:user_id] = nil
    redirect('/')
  end

  get '/post/peeps' do
    if current_user
      erb(:"peeps/new_peeps")
    else
      redirect to '/users/sign_in'
    end
  end

  post '/peeps/write' do
    current_user.peeps.create(message: params[:message], timestamp: Time.now)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
