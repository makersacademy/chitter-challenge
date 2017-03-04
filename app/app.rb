ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'dm-timestamps'

class ChitterApp < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'


   helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
      end
    end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/users' do
    @user = User.create(full_name: params[:full_name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/write_peep')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

get '/write_peep' do
  erb :write_peep
end

get '/read_peep' do
  @peep = Peep.all
  erb :read_peep
end

post '/peeps' do
  peep = Peep.create(body: params[:peep_content],
                  created_at: Time.now,
                  peep_author_name: current_user.full_name,
                  peep_author_username: current_user.username,
                  user_id: current_user.id)
  redirect to('/read_peep')
end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/write_peep')
    else
      flash.now[:errors] = ['The email or password is incorrect']
       erb :sign_in
    end
  end

  delete '/sign_out' do
    session[:user_id] = nil
    redirect to('/')
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
