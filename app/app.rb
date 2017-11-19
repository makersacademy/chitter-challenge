ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'dm-postgres-adapter'
require_relative './datamapper_setup'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base

get '/' do
  erb(:index)
end

get '/newpeep' do
  erb(:newpeep)
end

post '/peeps' do
  Peep.create(text: params[:text])
  redirect to '/peeps'
end


get '/peeps' do
  @peeps = Peep.all
  erb(:peeps)
end

end


DataMapper.finalize
