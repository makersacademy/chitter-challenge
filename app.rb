require_relative'./lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.show_all
    erb(:index)
  end

  post '/add' do
    puts params[:tb_peep]
    Peep.add(1, params[:tb_peep])
    redirect('/')
  end
  run! if app_file == $0
end
