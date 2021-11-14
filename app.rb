require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end
  
  get '/peeps' do
    erb(:'peeps/index', locals: { peeps: Peep.all })
  end

  post '/peeps' do
    Peep.create(message: params[:message], post_time: Time.new.strftime("%d/%m/%y - %R").to_s)
    redirect '/peeps'
  end

  run! if app_file == $0
end
