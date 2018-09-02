require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end


  get '/peeps/add' do
    erb :'peeps/add'
  end


  post '/peeps' do
    Peep.create(params['text'])
    redirect '/peeps'
  end


  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep_id = params[:id]
    erb :'peeps/edit'
  end


  patch '/peeps/:id' do
    p params
    Peep.update(params[:id], params[:text])
  #  "UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}' RETURNING id, url, title;"
    redirect '/peeps'
  end


run! if app_file == $0
end
