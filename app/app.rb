ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'


class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(message: params[:msg], created_at: Time.now)
    redirect '/peeps'
  end

 # .strftime("Printed on %m/%d/%Y") to format time (Nilclass error)
  #
  # get '/peeps' do
  #   erb(:index)
  # end
  #
  # post '/' do
  #   $peep = params[:msg]
  # end
  #
  #
  # post '/timeline' do
  #   $peep = params[:msg]
  #   erb(:timeline)
  # end
  #

# start the server if ruby file executed directly
# run! if app_file == $0
end
