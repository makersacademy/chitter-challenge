require 'sinatra/base'
require './lib/chitter_peeps'

class Chitter < Sinatra::Base

get '/' do
  erb(:index)
end

get '/peeps' do
  @peepspage = Chitter_peeps.all
  erb(:'peeps/index')
end

get '/peeps/new' do
  erb(:'peeps/new')
end

post '/peeps' do
  Chitter_peeps.create(peep: params['peep'])

  redirect '/peeps'
end




  run! if app_file == $0
end
