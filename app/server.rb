require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require_relative 'models/peep'
require_relative 'models/user'

enable :sessions
set :session_secret, 'super secret'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  @peeps = Peep.all
  erb :index
  end

  post '/peeps' do
  text = params["text"]
  Peep.create(:text => text)
  redirect to('/')
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  User.create(:email => params[:email],
              :password => params[:password])
  redirect to('/')
end
