require 'data_mapper'
require 'sinatra'
require_relative 'user'
require_relative 'peep'
require './lib/helpers/application'

env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/user'
DataMapper.finalize
# DataMapper.auto_migrate!
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'


get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  message = params["message"]
  Peep.create(:message => message)
  redirect to('/')
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.create(:email => params[:email],
              :password => params[:password])
  session[:user_id] = @user.id
  redirect to('/')
end


