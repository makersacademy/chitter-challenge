ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @peeps = Peep.all #fetches all data from the database pertaining to Peep class
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
  Peep.create(message: params[:message], title: params[:title])
  redirect '/peeps'
end

# start the server if ruby file executed directly
# run! if app_file == $0

end
