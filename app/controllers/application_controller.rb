require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
	end

	get "/" do
    @peeps = Peep.all
		erb :index
	end

	get "/signup" do
		erb :signup
	end

	post "/signup" do
    @user = User.new(:username => params[:username],
                    :password => params[:password],
                    :real_name => params[:real_name],
                    :email => params[:email]
                    )              
  
    if @user.save
      redirect "/login"
    else
      erb :signup
    end
	end

	get "/login" do
		erb :login
	end

	post "/login" do
		user = User.find_by(:username => params[:username])

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/success"
    else
      redirect "/" # Need "unsuccessfull login"
    end
	end

	get "/success" do
		if session[:user_id] == nil
      redirect "/login"
		else
			erb :success
		end
	end

	# get "/failure" do
  #   @errors = user.errors.full_messages
	# 	erb :failure
	# end

	get "/logout" do
		session.clear
		redirect "/"
	end


end