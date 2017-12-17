ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require_relative 'models/peep'
require 'rack/test'
require 'date'

class Chitter < Sinatra::Base

  get '/' do
    "hello"
  end


get '/peeps' do
  @peeps = Peep.all.reverse
  erb :'peeps/index'
end

get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  Peep.create(msg: params[:msg], time_stamp: Time.new)
  redirect '/peeps'
end

run! if app_file == $0

end
