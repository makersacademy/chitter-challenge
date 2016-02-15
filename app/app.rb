ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
	enable :sessions
  set :public_folder, Proc.new { File.join(root, 'static') }
  helpers Helpers
	use Rack::MethodOverride
  register Sinatra::Flash


  get '/' do
    @user=User.all
    @peeps = Peep.all 
    erb :index
  end

  get '/register' do 
  erb :register
  end 

  post '/register' do 
  	@user = User.create(first_name: params[:first_name], last_name: params[:last_name],
  		username: params[:username], email: params[:email], 
  		password: params[:password], 
  		password_confirmation: params[:password_confirmation])

  	session[:user_id] = @user.id
	  	 if @user.saved?
	      session[:user_id] = @user.id
	      redirect to('/logged_in')
	    else
	      flash.now[:errors] = @user.errors.full_messages
	    end
  end

  get '/login' do 
  	erb :login
  end

  post '/login' do 

		
		user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/logged_in')
    else
      flash.now[:errors] = ['The email or password is incorrect']
    end
  end

  get '/logged_in' do 
    @comments=Comment.all
    @user=User.all
    @peeps = Peep.all 
  	erb :logged_in
 	end

  get '/peeps' do
    @comments=Comment.all
    @peeps = Peep.all 
  	erb :peeps
  end

  post '/peeps' do 
  @peep = Peep.new(content: params[:content], time: params[:time], 
  created_at: params[:created_at])
  @peep.user = User.get(session[:user_id])
  @peep.save
  redirect to('/logged_in')
  end

  post '/comment' do 
  puts '-----'
  @comment = Comment.new(comment: params[:comment])
  session[:peep_id] = params[:peep]
  @comment.peep = Peep.get(params[:peep])
  @comment.save
  puts @comment.saved?
  redirect to('/logged_in')
  end


  delete '/log_out' do
   	session[:user_id] = nil
  	redirect '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
