require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  helpers ChitterHelpers

  get '/' do
    @topbox = current_user ? :peep_form : :welcome
    @peeps = Peep.all
    erb :index
  end

  post '/send-peep' do
    message = params[:message]
    Peep.create(message: message, user: current_user) unless message.empty?
    redirect '/'
  end

  get '/sign-up' do
    @topbox = :user_sign_up
    @peeps = Peep.all
    erb :index
  end

  post '/sign-up' do
    user = User.new(name: params[:name], email: params[:email],
      password: params[:password], handle: params[:handle])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end

  get '/log-in' do
    @topbox = :user_log_in
    @peeps = Peep.all
    erb :index
  end

  post '/log-in' do
    user = User.authenticate(params[:handle], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = ['The handle or password is incorrect']
      redirect '/log-in'
    end
  end

  post '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
