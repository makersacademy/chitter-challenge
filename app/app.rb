ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load
require_relative 'models/data_mapper_setup'
require_relative 'helpers'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers Helpers

  get '/sms' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Thanks for the message!"
    end
    # peep = Peep.new(text:params[:Body], time:Time.new)
    # current_user.peeps << peep
    # peep.save
    # current_user.save
    # response = "Thanks for your peep - view it at https://pauly-chitter.herokuapp.com"

  twiml.text
  end

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/signup' do
    @user = User.new
    erb :'signup/signup'
  end

  post '/signup' do
    @user = User.new(name:params['name'], username:params['username'],email:params['email'], password:params['password'], password_confirmation:params['password_confirmation'])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Passwords did not match."
      erb :'signup/signup'
    end
  end

  get '/signin' do
    erb :'signin/signin'
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:notice] = "Invalid username or password"
      erb :'signin/signin'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/postpeep' do
    #client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    peep = Peep.new(text:params[:new_peep], time:Time.new)
    # client.messages.create(
    # to: "+447709344456",
    # from: "+441233800814",
    # body: "#{peep.text}"
    # )
    current_user.peeps << peep
    peep.save
    current_user.save
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
