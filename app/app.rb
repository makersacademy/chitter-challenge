require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

	get "/" do
		erb :"/index"
	end

	post "/" do
		name = params[:name]
    	email = params[:email]
    	password = params[:password]
    	user = params[:user]
    	User.create(name: name, email: email, password: password, user: user)
		redirect "/new"
	end

	get "/new" do
		erb :"/newpost"
	end

	post "/new" do
		peep = Peep.create(user: User.user, text: params[:text])  
		redirect "/posts"
	end

	get "/posts" do
		@peeps = Peep.all
		@users = User.all
		erb :"/posts"
	end

	run! if app_file == $0
end