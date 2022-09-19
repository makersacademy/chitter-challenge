require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require './models/user'
require './models/post'
require 'bcrypt'
require 'mail'


# needs testing before implementation
# options = { :address              => "smtp.mail.yahoo.com",
#             :port                 => 465,
#             :domain               => 'your.host.name',
#             :user_name            => 'smtp.mail.yahoo.com',
#             :password             => 'iamab34n!',
#             :authentication       => 'plain',
#             :enable_starttls_auto => true  }



# Mail.defaults do
#   delivery_method :smtp, options
# end


configure :production do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter', pool: 2}
end

class Application < Sinatra::Base
  enable :sessions

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  get '/' do
    @alert = nil
    @peeps = Post.all.order(created_at: :desc)
    @users = User.all
    if session[:user_id] != nil
      @session = session[:user_id]
    end
    erb :index
  end

  get '/sessions/new' do
    @alert
    erb :'sessions/login'
  end

  post '/sessions/login' do
    # authenticate user with bcrypt
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      @alert = "You have successfully logged in"
      session[:user_id] = user.id
      redirect to('/')
    else
      @alert = "Incorrect email or password"
      erb :'sessions/login'
    end
  end


  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  # tested
  get '/users/new' do
    erb :'users/new'
  end

  # tested
  post '/sign_up' do
    # TODO: need to test for SQL injection on name, username, email, password
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      @alert =  "Error (#{ @user.errors.full_messages.join(', ') })"
      erb :'users/new'
    end
  end

  post '/peeps' do
    REGEX_INJECTION = /('(''|[^'])*')|(;)|(\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})\b)/
    if !params[:body].match(REGEX_INJECTION) && params[:body].length <= 140 && params[:body].length > 0
      tags = params[:body].scan(/\B@[a-z0-9_-]+/i).map { |tag| tag.remove('@') } 
      # remove any script tags very basic need to find a sanitiser gem
      body = params[:body].gsub(/[<>]/, '')
      Post.create(body: body, tags: tags, user_id: session[:user_id])
      redirect to('/')
    else
      @alert = "Error: Peep must be between 1 and 140 characters and not contain SQL injection"
      redirect to('/')
    end
  end

end