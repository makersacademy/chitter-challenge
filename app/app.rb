# ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require './app/models/cheeps'

class Chitter < Sinatra::Base

  get "/" do
    erb(:index)
  end

  get "/newsfeed" do
    @cheeps = Cheeps.all
    erb(:newsfeed)
  end

  # get "/bookmarks/new" do
  #   erb(:new)#:bookmarks/new
  # end

  post '/newsfeed/new' do
    Cheeps.create(
    # :id => 1,
    :username => params[:username], #eventually change to @username
    :message => params[:message],
    :timestamp => Time.now
    )
    redirect "/newsfeed"
  end

end
