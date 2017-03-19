ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'pry'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all.reverse
    erb :peep_board
  end

  get '/log_in' do
    erb :log_in
  end

  post '/existing_user' do
    user = User.authenticate(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.next[:error_1] = "Your details are incorrect, please try again or sign up"
        redirect '/log_in'
      end
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    @user = User.new(name: params[:name],
             user_name: params[:user_name],
             email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name
      redirect '/new_peep'
    else
      flash.next[:error_2] = "Please try again"
      redirect '/sign_up'
    end
  end

  get '/new_peep' do
    if session[:user_id] == nil
      flash.next[:error_3] = "Please Log in First"
      redirect '/log_in'
    else
      erb :new_peep
      end
  end

  post '/peeps' do
    @peeps = Peep.create(peep: params[:peep], user_name: session[:user_name])
    redirect '/'
  end

  get '/change_order' do
    @peeps = Peep.all
    erb :peep_board
  end

  get '/log_out' do
    erb :log_out
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/log_in'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
