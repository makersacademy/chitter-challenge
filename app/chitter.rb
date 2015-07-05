require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/user'
require_relative './models/peep'

class CHITTERchallenge < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  register Sinatra::Flash

  set :session_secret, 'super secret'

  get '/' do
    redirect '/index'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => :date.desc )
    erb :'peeps'
  end

  post '/peeps' do
    new_peep = Peep.new(message: params[:peep],
                        date: Time.now)
    new_peep.save
    redirect '/peeps'
  end

  get '/index' do
    erb :'index'
  end

  post '/index' do
    @user = User.new(name: params[:sign_up_name],
                email: params[:sign_up_email],
                password: params[:sign_up_password],
                username: params[:sign_up_username])
    if @user.save || (params[:sign_in_username] && params[:sign_in_password]) != nil
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:error_sign_up] = @user.errors.full_messages
      erb :'/index'
    end
  end

  get '/log_in' do
    erb :'log_in'
  end

  post '/log_in' do
    user = User.authenticate(params[:sign_in_username],
                             params[:sign_in_password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:error_sign_in] = 'The email or password is incorrect'
      erb :'/log_in'
    end
  end


  def current_user
    current_user ||= User.get(session[:user_id])
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end



# '/peeps/:id'
