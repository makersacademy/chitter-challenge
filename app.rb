require 'sinatra/base'
require 'sinatra/reloader'

require './lib/peep.rb'

class Chitter < Sinatra::Base

	configure :development do
    register Sinatra::Reloader
  end

	get "/" do
		"Welcome to Chitter App"
	end



	post '/peeps' do
		Peep.create(peep: params[:message])
		redirect '/peeps'
	end

	get '/peeps/new' do
		erb :'peeps/new'
	end

	get '/peeps' do
		# This route displays all the peeps in chronological order
		@peeps = Peep.all
		erb :'peeps/index'
	end



	run! if app_file == $PROGRAM_NAME
end