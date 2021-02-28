require 'pg'
require 'sinatra/base'
require_relative './lib/peep.rb'

class ChitterApp < Sinatra::Base
  get '/' do
	 erb :index
	end

  get '/peeps' do
    @feed = Peep.all 
    erb :peeps
  end

  post '/peeps/new' do
    Peep.create(params[:make_peep])
    redirect '/peeps'
  end

	run! if app_file == $0
end