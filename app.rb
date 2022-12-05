require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repo'

DatabaseConnection.connect

class Application < Sinatra::Base
	# This allows the app code to refresh
	# without having to restart the server.
	configure :development do
		register Sinatra::Reloader


		get '/' do
			return erb(:welcome)
		end

		get '/user/:user' do
			peep_repo = PeepRepository.new

			@users = peep_repo.all
			return erb(:users)
		end
	end
end