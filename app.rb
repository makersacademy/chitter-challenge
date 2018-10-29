require 'sinatra/base'
require './lib/peep.rb'
if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end


class Chitter < Sinatra::Base

get '/' do
  @peeps = Peep.all
  erb :index
end

get '/peep/new' do
  erb :post
end

post '/peep' do
  peep = Peep.create(
    message: params[:message],
    time: Time.now.strftime("%A, %d %b %Y %l:%M %p"))
  redirect '/'
end


end
