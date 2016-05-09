require 'rubygems' #Don't know if I need this
require 'data_mapper'
require 'sinatra/base'
require_relative 'models/peep'
require 'database_cleaner'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/peeps' do
		@peeps = Peep.all
		erb :homepage	
	end

	get '/peeps/new' do
		erb :add_peeps
	end

	post '/peeps/new' do
		peep = Peep.new(username: params[:username], chitter: params[:chitter])
		peep.save
		redirect to('/peeps')
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
