ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

get('/') do
  @chits = Peep.all(:order => [ :time.desc ])
  p @chits
  erb :index
end

get('/add') do
  erb :add
end

post ('/') do
  erb :add
  peep = Peep.create(content: params[:content], time: Time.new )
  redirect '/'
end

end
