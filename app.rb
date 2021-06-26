require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
	enable :sessions, :method_override

  configure :development do
	   register Sinatra::Reloader
	 end

	 get '/' do
			"hello there"
	 end

	end