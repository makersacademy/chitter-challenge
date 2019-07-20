# frozen_string_literal: true

require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

# require 'pg'

# this is the chitter class
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/post_peep' do
    erb(:post_peep)
  end

  post '/post_peep' do
    Peep.create(text: params[:peep_text])
    # @peeps = Peep.all
    redirect '/view_peeps'
  end

  # get '/bookmarks' do
  #   @bookmarks = Bookmark.all
  #   erb :bookmarks
  # end
  
  get '/view_peeps' do
    @peeps = Peep.all
    erb(:view_peeps)
  end

  run if app_file == $PROGRAM_NAME
end
