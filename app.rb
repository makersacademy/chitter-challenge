require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

get '/' do
  'Welcome to Chitter!'
end

get '/peeps' do
  @peeps = Peep.all
  erb :peeps
end

get '/peeps/new' do
  erb :new
end

post '/peeps' do
  Peep.create(text: params['text'])
  redirect '/peeps'
end



run! if app_file == $0
end
