require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

	enable :sessions

	get "/" do
		erb :"/index"
	end

	post "/" do
		@peep = Peep.new(text: params[:text])
		username = User.first_or_create(name: params[:username],
			email: params[:email],
			password: params[:password],
			username: params[:users])
		@peep.users << username
		@peep.save
		redirect "/new"
	end

	get "/new" do
		erb :"/newpost"
	end

	post "/new" do
		redirect "/posts"
	end

	get "/posts" do
		@peeps = Peep.all
		@users = User.all
		erb :"/posts"
	end

	run! if app_file == $0
end