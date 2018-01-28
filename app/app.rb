ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require "./app/models/database_setup"

class Chitter < Sinatra::Base
  enable :sessions

  helpers do
    def member_name
      User.first.nil? ? "" : User.first.name
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
    User.create(:name => params[:name],
                :username => params[:username],
                :email => params[:email],
                :password => params[:password]
              )
    redirect "/cheeps"
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
