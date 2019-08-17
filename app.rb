require 'sinatra/base'
require_relative './lib/bookmark'
require './database_connection_setup'

class ChitterChallenge < Sinatra::Base
  enable :sessions, :method_override


    get '/mainpage' do
      @posts = Post.all
      p "------++++++++++-------"
      p @posts
      erb :'mainpage'
    end

    get '/mainpage/new' do
      erb :'/mainpage/new'
    end

    post '/mainpage' do
      flash[:notice] = "You must submit a valid URL." unless Post.create(url: params[:url], title: params[:title])
      redirect('/bookmarks')
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
