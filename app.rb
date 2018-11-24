require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/dm'
require_relative './lib/helpers'

class Chitter < Sinatra::Base
	enable :sessions
	register Sinatra::Flash

  get '/' do
    redirect(:peep_feed)
  end

  get '/peep_feed' do
  	@peeps = Peep.all(:order => [:created_at.desc], :limit => 10)
  	erb(:peep_feed)
  end

  get '/new_peep' do
  	erb(:new_peep)
  end

  post	'/new_peep' do
  	peep = Peep.create(
  		message_content: params[:message_content],
  		created_at: Time.now,
  		author: "Testing",
  		user_id: 1
  	)
  	redirect(:peep_feed)
  end

  post '/create_peep' do
  	redirect(:new_peep)
  end

  run! if app_file == $0
end