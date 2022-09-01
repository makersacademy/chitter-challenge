# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	get '/' do
		erb :index
	end

	get '/peeps' do
		@peeps = peeps.all
		erb :peeps
	end

end