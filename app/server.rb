require 'sinatra'
require 'data_mapper'
require 'rack-flash'


enable :sessions
set :session_secret, 'super secret'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
use Rack::Flash


helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  content = params["content"]
  author = params["author"]
  datetime = DateTime.now
  Peep.create(:content => content, :author => author, :created_at => datetime)
  redirect to ('/')
end

get '/users/new' do
   @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.create(:username => params[:username],
                    :email => params[:email],
                    :password => params[:password],
                    :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:notice] = "Sorry, your passwords don't match"
    erb :"users/new"
  end
end








