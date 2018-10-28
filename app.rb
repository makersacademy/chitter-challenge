require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

get '/' do
  erb :index
end

get '/peep/new' do
  erb :post
end

post '/peep' do
  peep = Peep.create(params[:message])
  redirect '/'
end


end
