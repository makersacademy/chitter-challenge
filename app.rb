ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './config/datamapper'
require 'pry'
require 'data_mapper'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index
  end

  get "/profile" do
    if signed_in?
      @peeps = Peep.all
      erb :profile
    else
      redirect '/signin'
    end
  end

  post "/peep" do
    peep = Peep.create(:content => params[:peep], :created_at => Time.now)
    redirect ("/profile")
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.create(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  get "/error" do
    erb :error
  end

  get "/signin" do
    erb :signin
  end

  post "/signin" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

private

  def signed_in?
    !current_user.nil?
  end

  def current_user
      @current_user ||= User.get(session[:user_id])
  end


  run! if app_file == $0
end
