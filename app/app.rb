ENV['RACK_ENV'] = 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new_post)
  end

  get '/posts' do
    erb(:posts)
  end

end
