require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep' 
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
     erb :index
  end

#   get '/bookmarks' do
#     @bookmarks = Bookmark.all
#     erb :index
#   end

#   get '/bookmarks/new' do
#     erb :"bookmarks/new"
#   end

#   post '/bookmarks' do
#     if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
#       Bookmark.create(url:params['url'])
#     else 
#       flash[:notice] = "You must submit a valid URL" 
#     end
#     redirect('/bookmarks')
#   end


  run! if app_file == $PROGRAM_NAME
end
