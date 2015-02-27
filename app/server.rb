require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/peep'
require './app/models/hashtag'


DataMapper.finalize

DataMapper.auto_upgrade!

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