require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

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
    @new_user = User.new(email: params[:sign_up_email],
                password: params[:sign_up_password],
                username: params[:sign_up_username])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Fill all the field please"
      erb :'/index'
    end


  end



  def current_user
    current_user ||= User.get(session[:user_id])
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end



# '/peeps/:id'
