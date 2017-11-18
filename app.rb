ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/peep.rb'

class Chitter < Sinatra::Base

get '/' do
  erb(:index)
end

get '/new_posts' do
  erb(:new_posts)
end

post '/chitter' do
  @peeps = Peep.all
  peep = Peep.create(message: params[:new_peep])
  peep.save
  erb(:chitter)
end

end
