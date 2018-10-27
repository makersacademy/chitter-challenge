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
  peeps = params['text']
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO chitter (peeps) VALUES('#{text}')")
  redirect '/peeps'
end



run! if app_file == $0
end
