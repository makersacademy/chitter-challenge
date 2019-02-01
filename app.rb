require 'sinatra/base'
require './lib/peeps'
require_relative 'database_helpers'

database_setup

class Chitter < Sinatra::Base

get '/' do
  @DB_peeps=Peeps.all
  erb :index
end

post '/peeps' do
  Peeps.create(message: params[:message])
  redirect ('/')
end

end
