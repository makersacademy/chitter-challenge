require 'data_mapper'
require 'sinatra'
require './app/models/peep'
require './app/models/hashtag'
require './app/models/maker'
require_relative 'helpers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'top secret'

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
  erb :"makers/new"
end

post '/makers' do
  maker = Maker.create(:name => params[:name],
                       :username => params[:username],
                       :email => params[:email],
                       :password => params[:password])
  session[:maker_id] = maker.id
  redirect to ('/')
end





