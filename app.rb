require 'sinatra/base'
require './lib/peep'
require './lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    "Chitter"
  end

  get '/chitter/sign_in' do
    erb :"chitter/sign_in"
  end

  get '/chitter/new' do
    erb :"chitter/new"
  end

  post '/chitter/sign_up' do
    @exists = false
    user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    if user.exists?
      @exists = true
      erb :"chitter/sign_in"
    else
      User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
      redirect "/chitter/valid_user"
    end
  end

  post '/chitter/sign_in' do
    @signed_in_erb = false
    signed_in = User.sign_in(username: params[:username], password: params[:password])
    if signed_in
      redirect "/chitter/valid_user"
    else
      erb :"chitter/sign_in"
    end
  end

  post '/chitter/new' do
    ans = Peep.create(message: params[:message], username: params[:username])
    if ans
      redirect "/chitter/valid_user"
    else
      redirect '/chitter'
    end
  end

  get "/chitter/valid_user" do
    @peeps = Peep.all
    erb :"chitter/index_signed_in"
  end

  get "/chitter" do
    @peeps = Peep.all
    erb :"chitter/index"
  end

end
