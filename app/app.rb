ENV["RACK_ENV"]||="development"
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user.rb'
require './app/models/peep.rb'
require './app/models/database_settings.rb'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'chitter secret'

  helpers do
    def current_user
      @current_user ||= User.get( session[:user_id] )
    end
  end

  get '/test' do
    erb :test
  end

  get '/' do
    @all_peeps = Peep.all
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-info' do
    user = User.create( name:  params[:name],  username: params[:username],
                        email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation] )
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in-info' do
    log_in_user = User.authenticate( params[:email], params[:password] )
    if !log_in_user
      flash[:notice] = "The email or password is incorrect"
      redirect '/log-in'
    end
    session[:user_id] = log_in_user.id
    redirect('/')
  end

  delete '/log-out' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/'
  end

  get '/log-out' do
    erb :log_out
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    time_now = Time.now.strftime("%I:%M %p  %Y-%m-%d")
    peep = Peep.create( time_now: time_now, message: params[:message] )
    user = current_user
    user.peeps << peep
    user.save
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
