require 'pg'
require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

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

  get '/register' do
    erb :register
  end

  post '/register/new' do
    User.new(params[:username], params[:pw], params[:email])
    redirect ('/peeps')
  end

  # get '/sign_in' do
  #   erb :sign_in
  # end

	run! if app_file == $0
end