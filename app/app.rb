ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'models/peep'

class Chitter < Sinatra::Base

  TIME_FORMAT = '%H:%M, %d.%m.%y '

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: Time.now.strftime(TIME_FORMAT))
    redirect('/peeps')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
