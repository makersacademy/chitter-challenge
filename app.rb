require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base 
		get '/' do 
				"Welcome to chitter!"
		end 

		get '/peeps' do
			p ENV
			@peeps = Peep.all
			erb :index
		end 

		get '/peeps/new' do
			erb :peep_new
		end 

		post '/peeps' do
			#content = params['content']
			#connection = PG.connect(dbname: 'chitter_test')
			#connection.exec("INSERT INTO chitters (content) VALUES('#{content}');")
			Peep.create(content: params[:content])
			redirect '/peeps'
		end 

		run if app_file == $0

end 
