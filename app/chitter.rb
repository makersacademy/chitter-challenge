require 'rubygems' #Don't know if I need this
require 'data_mapper'
require 'sinatra/base'
require_relative 'models/peep'
# require 'database_cleaner'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

 #  get '/peeps' do
	# 	@peeps = Peep.all
	# 	erb :homepage	
	# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
