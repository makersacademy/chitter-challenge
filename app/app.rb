require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root,'..','/app/views')}
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/feed' do
    @peeps = Peep.all
    erb :'feed/index'
  end

  get '/feed/new' do
    erb :'feed/new'
  end

  post '/feed/new' do
    peep = Peep.new(message: params[:message],
                    time: Time.now)
    peep.save
    redirect ('/feed')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/feed'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
