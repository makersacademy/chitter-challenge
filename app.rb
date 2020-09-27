require "sinatra/base"
require "./lib/user"

class Chitter < Sinatra::Base
  enable :method_override

  get "/" do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post "/sign_up" do
    User.create(params[:email], params[:password])
    redirect '/'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post "/sign_in" do
    User.log_in(params[:email], params[:password])

    redirect "/peeps"
  end

  get "/peeps" do
    @user = User.show
    erb :peeps
  end

  post "/log_out" do
    User.log_out
    redirect '/'
  end

  run! if app_file == $0
end
