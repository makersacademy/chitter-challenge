ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/peeps/add' do
    erb(:add)
  end

  post '/peeps/add' do
    redirect '/peeps/added'
  end

  get '/peeps/added' do
    peep = params['peep_message']
    erb(:confirmation)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
