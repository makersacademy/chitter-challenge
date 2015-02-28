require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require './app/models/peep'
require './app/models/hashtag'
require './app/models/maker'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'top secret'
use Rack::Flash

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  message = params["message"]
  user = params["user"]
  hashtags = params["hashtags"].split(" ").map{|hashtag| Hashtag.first_or_create(:text => hashtag)}
  Peep.create(:message => message, :user => user, :hashtags => hashtags)
  redirect to('/')
end

get '/hashtags/:text' do
  hashtag = Hashtag.first(:text => params[:text])
  @peeps = hashtag ? hashtag.peeps : []
  erb :index
end

get '/makers/new' do
  @maker = Maker.new
  erb :"makers/new"
end

post '/makers' do
  @maker = Maker.create(:name => params[:name],
                       :username => params[:username],
                       :email => params[:email],
                       :password => params[:password],
                       :password_confirmation => params[:password_confirmation])
  if @maker.save
    session[:maker_id] = @maker.id
    redirect to ('/')
  else
    flash.now[:errors] = @maker.errors.full_messages
    erb :"makers/new"
  end
end

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  username, password = params[:username], params[:password]
  maker = Maker.authenticate(username, password)
  if maker
    session[:maker_id] = maker.id
    redirect to ('/')
  else
    flash[:errors] = ["The username of password are incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:maker_id] = nil
  redirect to('/')
end




