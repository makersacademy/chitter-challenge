require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/makers_students'
require './lib/chitter'

class ChitterMessage < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    ##sign in
    erb :index
  end

  post '/new' do
    ##request new student
    erb :index
  end
  
  get '/students' do
    @students = Student.all
    ## need a html button for descending order
    erb :students
  end

  get '/chitter' do
    @chitters = ChitterApp.all
    "This is my chitter page"    
    erb :chitters
  end

  get '/chitter/new' do
    ## add new chitters
    p params
    erb :"chitter_new"
  end

  post '/chitter' do    
    ChitterApp.create(params[:chitter])    
    redirect '/chitter'
  end
#####
  # post '/bookmarks' do
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end

  # post '/bookmarks' do
  #   Bookmark.create(url: params[:url])
  #   redirect '/bookmarks'
  # end
#######
  get '/chitter/new' do
    ## add new chitters
    p params
    erb :"chitter/new"
  end

  run! if app_file == $0
end