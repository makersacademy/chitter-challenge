ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require "./app/models/database_setup"

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def user
      session[:id].nil? ? "" : User.get(session[:id]).name
    end
  end

  get "/" do
    "Hello world"
  end

  get "/cheeps/new" do
    erb :new_cheep
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:name => params[:name],
                :username => params[:username],
                :email => params[:email],
                :password => params[:password])
    if user.save
      session[:id] = User.first.id
      redirect "/cheeps"
    else
      flash.next[:login_error] = user.check_duplicates
      redirect "/signup"
    end
  end

  post "/cheeps/new" do
    Cheep.create(:message => params[:cheep])
    redirect 'cheeps/new'
  end

  get "/cheeps" do
    @cheeps = Cheep.all(:order => [:created_at.desc])
    erb :cheeps
  end

end
