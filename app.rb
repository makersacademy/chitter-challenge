# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, :layout => :layout
  end

  get '/peeps' do
    erb :'peeps/feed', :layout => :layout
  end

  get '/peeps/new' do
    erb :'peeps/new_peep', :layout => :layout
  end

  post '/save-new-peep' do
    content = params[:content]
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('#{content}', current_timestamp, 1)");
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME

end
