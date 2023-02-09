require "sinatra/base"
require "sinatra/reloader"
require "sinatra/activerecord"
require "rack-flash"

require_relative "./models/user"
require_relative "./models/peep"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    enable :sessions
    use Rack::Flash
  end

  get "/" do
    @peeps = Peep.joins(:user).reverse_order
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    end
    return erb(:homepage)
  end

  get "/new-peep" do
    if session[:user_id].nil?
      flash[:message] = "You have to log in to leave a peep."
      redirect "/login"
      return redirect "/login"
    else
      return erb(:new_peep)
    end
  end

  get "/login" do
    if session[:user_id].nil?
      return erb(:login)
    else
      redirect "/"
    end
  end

  get "/logout" do
    session[:user_id] = nil
    redirect "/"
  end

  post "/login" do
    # Check if empty inputs
    if params[:email] == "" || params[:password] == ""
      flash[:message] = "Email or password can't be empty."
      redirect "/login"
    end
    user = User.find_by(email: params[:email])
    # Check password
    if user.nil? || !user.authenticate(params[:password])
      flash[:message] = "Invalid email or password. Please try again."
      redirect "/login"
    end
    # Save user id into session
    session[:user_id] = user.id
    redirect "/"
  end

  post "/new-peep" do
    content = params[:content]
    # Redirect back to /new-peep if an empty content is received
    if content == ""
      flash[:message] = "Content can't be empty."
      redirect "/new-peep"
    end

    if !session[:user_id].nil?
      user = User.find(session[:user_id])
      peep = Peep.new(content: content, user: user)

      if peep.valid?
        peep.save
        flash[:message] = "Your peep has been created successfully!"
        redirect("/")
      else
        error = ""
        peep.errors.messages.each do |k, v|
          error << "#{key.to_s.capitalize}: #{value.join}\n"
        end
        flash[:message] = error
        redirect "/new-peep"
      end
    else
      flash[:message] = "You have to log in to leave a peep."
      redirect "/login"
    end
  end
end
