ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/" do
    erb(:home)
  end

  get "/sign_up" do
    erb(:sign_up)
  end

  post "create_user" do
    @new_user = User.create(user_name: params[:new_username])
  end

end
