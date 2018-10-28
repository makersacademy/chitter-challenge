require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/post_peep' do
    redirect '/peeps'
  end

  get '/peeps' do
    @messages = Message.all

    erb :peeps
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/message' do
    Message.add(params[:MESSAGE], params[:TAG])
    redirect '/peeps'
  end

  get '/register' do
    @user_added = User.last
    erb :register
  end

  post '/register' do
    User.add(params[:USERNAME], params[:TAG])
    redirect '/user_added'
  end

  get '/user_added' do
    @user_added = User.last
    erb :user_added
  end

  post '/message_signed_in' do
    Message.add(params[:MESSAGE], params[:TAG])
    # @user_now = User.last
    redirect '/peeps'
  end

  # get '/bookmarks' do
  #   @bookmarks = Bookmark.all
  #   erb :bookmarks
  # end
  #
  # post '/add_bookmark' do
  #   redirect '/new_bookmark'
  # end
  #
  # get '/new_bookmark' do
  #   erb :new_bookmark
  # end
  #
  # post '/bookmark_added' do
  #   Bookmark.add(params[:TITLE], params[:URL])
  #   redirect '/bookmarks'
  # end

  run! if app_file == $0

end
