ENV["RACK_ENV"] ||= "development"

require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret,  'SUPER SECRET'

  get '/' do
    p current_user
    @peeps = Peep.all
    erb :'peep/all'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep' do
    Peep.create(body: params[:body])
    redirect '/'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    if @user.save
      p session[:user_id] = @user.id
      redirect '/'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
