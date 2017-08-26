require 'sinatra/base'
require_relative 'models/peep'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

	get '/' do
		erb :"/index"
	end

	get "/posts" do
		@peeps = Peep.all
		erb :"/posts"
	end

	post "/posts" do
		Peep.create(user: params[:user], text: params[:text])
		redirect "/posts"
	end

	run! if app_file == $0
end