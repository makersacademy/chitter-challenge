require 'sinatra/base'
require './lib/peep'
require 'pry'
require 'time'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all.sort_by { |peep| peep['id'] }.reverse
    erb :'index'
  end

  post '/peeps' do 
    name = params["name"]
    text = params["text"]
    Peep.create(text: text, name: name)
    redirect '/'
  end
end