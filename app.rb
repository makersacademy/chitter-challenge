require 'sinatra/base'
require_relative './lib/post'

#Runs script to connect to database
require './database_connection_setup'

class ChitterChallenge < Sinatra::Base
  enable :sessions, :method_override

    get '/' do
      "Hello"
      erb :index
    end

    get '/mainpage' do
      @posts = Post.all
      erb :mainpage
    end

    get '/new' do
      erb :new
    end

    post '/mainpage' do
      Post.create(msg: params[:msg])
      redirect('/mainpage')
    end

    post '/order' do
      @posts = Post.all
      @posts.sort_by! {|post| post.msg.length}
      erb :mainpage
    end
    #
    # delete '/bookmarks/:id' do
    #   Bookmark.delete(id: params[:id])
    #   redirect '/bookmarks'
    # end
    #
    # get '/bookmarks/:id/update' do
    #   @bookmark = Bookmark.find(id: params[:id])
    #   erb :'/bookmarks/update'
    # end
    #
    # patch '/bookmarks/:id' do
    #     Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    #     redirect '/bookmarks'
    # end

    run! if app_file == $0

end
