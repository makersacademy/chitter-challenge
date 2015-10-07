require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  helpers ChitterHelpers

  get '/' do
    @topbox = current_user ? :peep_form : :welcome
    @peeps = Peep.all
    erb :'index'
  end

  get '/sign-up' do
    @topbox = :user_sign_up
    @peeps = Peep.all
    erb :index
end

  post '/sign-up' do
    user = User.new(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:passowrd],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to ('/')
    else
      flash[errors] = user.errors.full_messages
    redirect '/sign-up'
    end
  end

  get '/log-in' do
    @topbox = :user_log_in
    @peeps = Peep.all
    erb :'index'
  end

  post '/log-in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user_id
      redirect '/'
    else
      flash[:errors] = ["The username or password is incorrect. Please try again."]
      redirect '/log-in'
    end
  end


  # post '/sessions' do
  #   user = User.authenticate(params[:email], params[:password])
  #   if user
  #     session[:user_id] = user.id
  #     redirect to('/')
  #   else
  #     flash.now[:errors] = ['The email or password is incorrect']
  #     erb :'sessions/new'
  #   end
  # end
  #
  # delete '/sessions' do
  #   flash.now[:notice] = :goodbye!
  #   session[:user_id] = nil
  #   erb :'sessions/goodbye'
  # end
  #
  # get '/peep/new' do
  #   erb :'peeps/new'
  # end
  #
  # post '/' do
  #   posted = Time.now
  #   params[:posted] = posted
  #   peep = Peep.create(message: params[:message], posted: params[:posted])
  #   tag = Tag.create(name: params[:tag])
  #   peep.tags << tag
  #   peep.save
  #   redirect to('/')
  # end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

run! if app_file == $PROGRAM_NAME
end
