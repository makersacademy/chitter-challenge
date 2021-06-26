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
		erb(:landing_page)
	end

	get '/sign_up' do
	  erb(:sign_up)
	end

	get '/log_in' do
		erb(:log_in)
	end

	get '/peeps' do
		erb(:peeps)
	end

end