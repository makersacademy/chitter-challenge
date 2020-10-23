require 'sinatra/base'
require_relative '../lib/peep.rb'
require_relative '../database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do 
    @sorted_peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    erb(:index)
  end

  get '/user/new' do
    erb(:'user/new')
  end

  get '/peep/new' do
    erb(:'peep/new')
  end

  post '/peep/add' do
    peep = "@#{params[:username]}: #{params[:body]} (#{Time.now.strftime("%Y-%m-%d %H:%M:%S")})"
    "#{peep}"
  end

  run! if app_file == $0
end

# get '/bookmarks' do
#   @bookmarks = Bookmark.all
#   # print @bookmarks
#   erb(:'bookmarks/index')
# end

# get '/add_bookmark' do
#   erb(:'bookmarks/add')
# end

# post '/add_to_database' do
#   Bookmark.create(params[:title], params[:url])
#   redirect('/bookmarks')
# end