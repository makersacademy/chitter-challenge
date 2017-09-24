ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :'peeps/new'
  end

post '/peeps' do
Peep.create(message: params[:message])
redirect '/list'
end

get '/list' do
  @peep = Peep.all
  erb :'peeps/list'
end

run! if app_file == $0

end
