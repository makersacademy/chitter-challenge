require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    p 'display splash page'
    @peeps = Peep.all
    p @peeps
    erb :peeps
  end

  post '/add' do
  @peeps = Peep.all
  Peep.add(peep_text: params[:peep_text])
  redirect '/'
end

  run! if app_file == $0
end
