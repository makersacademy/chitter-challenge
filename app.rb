ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/peep'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  get '/sign-up' do
  	erb :'sign-up'
  end

  post '/sign-up' do
  	user = User.new(name: params[:name], user_name: params[:user_name],
      email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/chitter-feed')
    else
      flash.now[:error] = user.errors.full_messages
      erb(:'sign-up')
    end

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/chitter-feed' do
  	@posts = Peep.all
  	erb :'chitter-feed'
  end

  post '/create-peep' do
  	Peep.create(post: params[:post], time: Time.now.strftime("%Y-%m-%d %H:%M"))
  	redirect '/chitter-feed'

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
