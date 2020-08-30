require 'sinatra/base'
require_relative './lib/peeps'
require './database_connection_setup'

class Chitter < Sinatra::Base

get '/' do
   erb(:index)
end

get '/peeps' do
  @peeps = Peeps.all
  erb(:peeps)
end

get '/peeps/new_peep' do
  erb :'peeps/new_peep'
end

post '/peeps' do
  Peeps.new_peep(text: params[:text])
  redirect '/peeps'
end

   run! if app_file == $0

end
