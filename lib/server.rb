require 'data_mapper'
require 'sinatra'
require './lib/helpers/application'
require 'rack-flash'

require_relative 'user'
require_relative 'peep'


use Rack::Flash

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
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(:name => params[:name],
                   :user_name => params[:user_name],
                   :email => params[:email],
                   :password => params[:password],
                   :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:notice] = "Sorry, your password don't match"
    erb :"users/new"
  end

end


# post '/users/signin' do
#     @user = User.create(:email => params[:email],
#                     :password => params[:password])



# end
post '/sessions/new' do
  erb :"sessions/new"
end


get '/signup' do
  erb :signup
end







