require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Chitter Home Page'
  end


end


   get '/peeps' do
  "Book mark manager"
   end
#
#     get '/bookmarks' do
#       # Print the ENV variable
#       # p ENV
#
#       @bookmarks = Bookmark.all
#       erb :'bookmarks/index'
#     end
#
#     get '/bookmarks/new' do
#     erb :"bookmarks/new"
#   end
#
#   run! if app_file == $0
# end
