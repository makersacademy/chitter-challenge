require "./config/environment"

class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
	end

	get "/" do
    @peeps = Peep.order(:created_at).reverse_order
		erb :index
	end

	get "/signup" do
    if logged_in?
      status 400
    else
		  erb :signup
    end
	end

	post "/signup" do
    @user = User.new(:username => params[:username],
                    :password => params[:password],
                    :real_name => params[:real_name],
                    :email => params[:email]
                    )              
  
      erb :signup
	end

	get "/login" do
    if logged_in?
      status 400
    else
		  erb :login
    end
	end

	post "/login" do
		user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      erb :failure
    end
	end

	get "/success" do
		if current_user
      erb :success
		else
      redirect "/login"
		end
	end

	get "/logout" do
    if logged_in?
      session.clear
		  erb :logout
    else
		  status 400
    end
	end

  get "/peep" do
    if logged_in?
		  erb :create_peep
    else
		  status 400
    end
	end

  post "/peep" do
    @peep = Peep.new(content: params[:content],
                     tagged_users: any_tagged_users?(params[:content]),
                     user_id: current_user.id )
    
    if @peep.save
      redirect "/"
    else  
      erb :create_peep
    end
	end

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def any_tagged_users?(content)
    tagged_users = []
    words = content.split
    usernames = User.pluck(:username)

    usernames.each do |username|
      if words.include?("@#{username}")
        tagged_users << username
      end
    end
    tagged_users
  end

end