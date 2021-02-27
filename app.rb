require 'sinatra/base'
require './lib/Chitter.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

    get '/' do
      erb :index
    end

    get '/chitter_feed' do
      p ENV
      @chitter_feed = Chitter_Page.all
      erb :chitter_feed
    end

    # post '/chitter_feed' do
    #   Chitter_Page.create(comment: params[:comment])
    # redirect '/chitter_feed'
    # end
    #
    # delete '/chitter_feed_remove/:id' do
    #   Chitter_Page.delete(id: params[:id])
    #   redirect '/chitter_feed'
    # end
    #
    # patch '/chitter_feed_update/:id' do
    #   Chitter_Page.update(id: params[:id], comment: params[:comment])
    #   redirect '/chitter_feed'
    # end

end
