require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/view_peeps' do
    @peep = Peep.view_all
    erb :view_peeps
  end



  run! if app_file == $0
end
