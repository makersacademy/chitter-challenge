ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/dm_start'
require './models/user'


class Chitter < Sinatra::Base

  enable :sessions

  get "/" do
    erb(:homepage)
  end

  get "/create_account" do
    erb(:create_account)
  end

  post "/account_created" do
    User.create(email: params[:email], password: params[:password])
    erb(:logged_in)
  end
end
