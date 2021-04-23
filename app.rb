require 'sinatra/base'
require 'sinatra/reloader'
require './lib/tweets'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
  	end

	get '/' do 
    @tweets = Tweets.all
		erb :'index'
	end

  get '/tweets' do 
    @tweets = Tweets.all
    erb :'tweets'
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