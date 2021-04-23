require 'sinatra/base'
require 'sinatra/reloader'
require './lib/tweet'
require 'pg'
# require 'datamapper'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
    # DataMapper.setup(:default, 'postgres://phil@127.0.0.1:5432/chitter')
	end
  
  configure :production do
    # DataMapper.setup(:default, 'postgres://phil@127.0.0.1:5432/chitter')
  end

	get '/' do 
		erb :'index'
	end

  # post '/new' do
  #   Bookmark.create(params[:add_bookmarks_title],  params[:add_bookmarks_url])
  #   redirect '/bookmarks'
  # end

	# get '/bookmarks' do
	# 	@bookmarks = Bookmark.all
	# 	erb :'bookmarks/index'
	# end


	run! if app_file == $0
end