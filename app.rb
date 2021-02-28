require 'pg'
require 'sinatra/base'

class ChitterApp < Sinatra::Base
  get '/' do
	 erb :index
	end

  get '/peeps' do
    @feed = ["Hi Chitter!"]
    erb :peeps
  end
	run! if app_file == $0
end