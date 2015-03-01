require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  set :views, Proc.new {File.join(root, "..", "views")}

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  require_relative './lib/cheet'
  require_relative './lib/user'

  DataMapper.finalize
  DataMapper.auto_upgrade!


  get '/' do
    @cheets = Cheet.all
    erb :index
  end

  post '/cheets' do
    message = params["message"]
    created_at = params["date"]
    user_id = params["user_id"]
    Cheet.create(:message => message, :created_at => created_at, :user_id => user_id)
    redirect('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(:email => params[:email],
                :password => params[:password],
                :username => params[:username])
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
