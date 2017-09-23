ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'database_setup'
require_relative 'models/name_getter'
require 'sinatra/flash'

class ChitterClone < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/peeps' do
    @peeps ||= Peep.all.reverse
    @current_user = session[:current_user]
    @current_user ||= 'Stranger'
    # refactor above three lines to two separate helpers
    erb :'peeps/index'
  end

  post '/peep/new' do
    peep = Peep.create(body: params[:peep_body])
    peep.save
    redirect to('/peeps')
  end

  get '/signup_to_peep' do
    @user_email = session[:email_address]
    @user_real_name = session[:real_name]
    flash.now[:notice] = 'Password and confirmation password do not match' if session[:mismatch_password] == 'true'
    erb :'sign_up/signup_to_peep'
  end

  post '/signup_new' do
    user = User.create(real_name: params[:real_name],
                       username: params[:username],
                       email_address: params[:email_address],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:current_user] = user.real_name
      redirect to('/peeps')
    else
      session[:mismatch_password] = 'true'
      session[:email_address] = params[:email_address]
      session[:real_name] = params[:real_name]
      redirect to('/signup_to_peep')
    end
  end

  run! if app_file == $PROGRAM_NAME
end
