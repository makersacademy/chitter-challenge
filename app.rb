require 'sinatra/base'
require './lib/chitter'
require './lib/account'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :'sign_up'
  end

  post '/' do
    Account.create(email: params['email'], password: params['password'])
    redirect '/messages'
  end

  get '/messages' do
    @messages = Chitter.all
    erb :'messages'
  end


  post '/messages' do
    time = (Time.now.strftime("%H") + ":" + Time.now.strftime("%M"))
    Chitter.create(message: "Chitter at " +time + " : " + params['message']).to_s
    redirect '/messages'
  end

end




# require 'sinatra/base'
# require './lib/bookmark'
#
# class BookmarkManager < Sinatra::Base
#   get '/' do
#     'Bookmark Manager'
#   end
#
#   get '/bookmarks' do
#     #p ENV
#
#     @bookmarks = Bookmark.all
#     erb :'bookmarks/index'
#   end
#
#   get '/bookmarks/new' do
#   erb :"bookmarks/new"
# end
#
# post '/bookmarks' do
#   Bookmark.create(url: params['url'])
#   redirect '/bookmarks'
# end
#
#   # without refactoring
#   # url = params['url']
#   # connection = PG.connect(dbname: 'bookmark_manager_test')
#   # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
#   # redirect '/bookmarks'
#
#   post '/bookmarks/new' do
#   Bookmark.create(url: params[:url], title: params[:title])
#   redirect '/bookmarks'
# end
#
#
#   #run! if app_file == $0
# end
