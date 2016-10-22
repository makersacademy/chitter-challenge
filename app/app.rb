ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base
get '/' do
  "Hello ChitterChallenge World!!!"
  redirect '/peeps/new'
end

get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
end

get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  #Name will default to logged_in user name. It won't be editable.
  Peep.create(name: params['name'], message: params['message'] )
  redirect '/peeps'
end
  #run! if app_file == $0
end
