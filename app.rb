require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    @peeps.each {|peep| p peep.creation_time }
    erb(:index)
  end

  post '/peeps/new' do
    Peep.create(description: params[:peep]).first
    redirect '/'
  end

end
