require 'pry'
require 'sinatra/base'
require './config/data_mapper'
require "mail"
require "dotenv/load"

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  def initialize(app = nil, mailer)
    super(app)
    @mailer = mailer
  end

  attr_accessor :mailer

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(
      text: params[:peep], posted_at: Time.now, user: current_user
    )
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  post '/signup' do
    user = User.new(
      email: params[:email],
      password: params[:password],
      actualname: params[:actualname],
      username: params[:username]
    )
    if user.save
      mailer.send_welcome_email(user.email, user.actualname)

      mail = ::Mail.new do
        from "scass@hotmail.co.uk"
        to user.email
        subject "Welcome!"
        body <<-CHEESE
         Hey #{user.actualname}
         how are you?
        CHEESE
      end
      mail.delivery_method :smtp, {
        address: "smtp.live.com",
        port: 587,
        user_name: "scass@hotmail.co.uk",
        password: ENV["PASSWORD"],
        authentication: :login,
        enable_starttls_auto: true
      }

      mail.deliver!

      session[:id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  get '/profile' do
    @peeps = Peep.all
    if signed_in?
      erb :profile
    else
      redirect 'signin'
    end
  end

  get '/error' do
    erb :error
  end

  delete '/log-out' do
    session.delete(:user_id)
    redirect '/'
  end

private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
