require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
 	set :views, Proc.new {File.join(root, '.', "views")}
  set :public, Proc.new { File.join(root, '.', "public") }

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash
	use Rack::MethodOverride

  get '/' do
  	@peeps = Peep.all
    erb :index
  end

  get '/users/new' do
  	@user = User.new
  	erb :"users/new"
  	
  end

  post '/users' do
  	@user = User.create(email: params[:email],
  							username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
  	if @user.save
  			session[:user_id] = @user.id
 				redirect to("/")
  	else
  			flash.now[:errors] = @user.errors.full_messages
  			erb :"users/new"
  	end
  end

  get "/users/password_reset" do
    erb :"users/password_reset"
  end

  post "/users/password_reset" do
    user = User.first(email: params[:email])
    user.update(password_token: rand_token)
    flash[:notice] = 'Check your emails'
  end

  get "/users/password_reset_reset/:token" do
  	session[:token] = params[:token]
  	erb :"users/password_reset_reset"
  end

  get "/sessions/new" do
  	erb :"sessions/new"
  end

  post "/sessions" do
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect to('/')
  	else
  		flash.now[:errors] =  ['The email or password is incorrect']
  		erb :"sessions/new"
  	end
  end

  delete "/sessions" do
  	session.clear
  	flash[:notice] = "You are now logged out"
  	redirect "/"
  end

  get "/peeps" do
  	@peeps = Peep.all
    # (:order => [ :time.desc ])
  	erb :"peeps/index"
  end

  get "/peeps/new" do
  	erb :"peeps/new"
  end

  post "/peeps" do
   current_user.peeps.create(content: params[:content], time: Time.now)
   p Peep.first
   redirect to("/peeps")
  end


  helpers do

  	def current_user
      current_user ||= User.get(session[:user_id])
    end

    def rand_token
   		[*'A'..'Z'].shuffle.join
  	end

  	def token?
    	User.first(password_token: session[:token])
  	end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
