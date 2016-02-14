ENV['RACK_ENV'] ||= 'development'
require 'rack'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'helpers'

class Chitter < Sinatra::Base
  helpers Helpers
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride



  get '/' do
    # @new_user = User.new
    erb :'user/index'
  end

  post '/sign_up' do
    @new_user = User.new(user_name: params[:user_name], password: params[:password],
    password_confirmation: params[:password_confirmation], email: params[:email])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/welcome'
    else
      sign_up_error_type
      memo_flashes
    end
    erb :'user/index'
  end


  post '/sign_in' do
    @user =
      User.authenticate(params[:existing_user_name], params[:existing_password])
    if @user
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash.now[:authentication_error] = sign_in_error_type
      erb :'user/index'
    end
  end

  get '/welcome' do
    @user = session_user.user_name
    erb :'user/welcome'
  end

  get "/chitter" do
   @peeps = Peep.all.reverse
   erb :session
  end

  post "/post_peep" do
    if peep_error?
      flash.next[:peep_error] = peep_error_message
    else
      @peep =
        Peep.new(peep_message: params[:peep], author: session_user.user_name)
      session_user.peeps << @peep
      session_user.save
    end
    redirect '/chitter'
  end

 delete '/goodbye' do
   session[:user_id] = nil
   flash.next[:notice_goodbye] = 'We are done... don\'t come crying back'
   redirect '/'
 end

  run! if app_file == $PROGRAM_NAME
end
