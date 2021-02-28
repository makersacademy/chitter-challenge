ENV['RACK_ENV'] ||= 'development'

require 'pg'
require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    nm = params[:name]
    ln = params[:last_name]
    usnm = params[:username]
    mail = params[:email]
    pw = params[:password]

    @user = User.new(nm, ln, usnm, mail, pw)
    redirect "/feed/#{@user.username}"
  end

  get '/feed/:username' do
    @username = params[:username]
    @chitter = Chitter.list
    erb :feed
  end

  post '/feed/:username' do
    @username = params[:username]
    Chitter.create(@username, params[:content])
    redirect "/feed/#{@username}"
  end

  run! if app_file == $0
end
