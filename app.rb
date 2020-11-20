require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base 
	 enable :sessions
	 get '/' do 
 			erb :welcome
 	end 

	 get '/peeps' do
 			#@user = User.find(session[:user_id])
 			@peeps = Peep.all
 			erb :index
 	end 

	 get '/peeps/new' do
 			erb :peep_new
 	end 

	 post '/peeps' do
 			Peep.create(content: params[:content])
 			redirect '/peeps'
 	end 

	 get '/users/new' do
 			erb :signup
 	end 

	 #post '/users' do
 		#	user = User.create(email: params['email'], password: params[:password])
 		#	session[:user_id] = user.id
 		#	redirect '/peeps'
 	#end 
		

	 run if app_file == $0

end 
