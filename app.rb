require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base

  enable :session

get '/' do
  'Welcome to Chitter!'
  erb :index
end

get '/peeps' do
  @peeps = Peep.all.reverse
  erb :peeps
end

get '/peeps/new' do
  erb :new
end

post '/peeps' do
  Peep.create(text: params['text'])
  redirect '/peeps'
end

get '/register' do
   erb :index
 end

 post '/register' do
  User.create(params[:name], params[:username], params[:email], params[:password])
  redirect "/peeps"
end

run! if app_file == $0
end
