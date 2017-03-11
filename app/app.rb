ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require './app/models/cheeps'

class Chitter < Sinatra::Base

  get "/" do
    erb(:index)
  end

  get "/newsfeed" do
    @cheeps = Cheep.all
    erb(:newsfeed)
  end

  # get "/bookmarks/new" do
  #   erb(:new)#:bookmarks/new
  # end

  post '/newsfeed/new' do
    Cheep.create(
    :username => params[:username], #eventually change to @username
    :message => params[:message]
    )
    redirect "/newsfeed"
  end

end
