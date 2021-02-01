require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get "/test" do
    erb :testing_index
  end

  get '/' do
    'Welcome to Chitter!'
  end

  get "/peeps" do
    # p @peeps
    @peeps = Peep.all
    erb :post_peep
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_manager')
    connection.exec("INSERT INTO peeps (message) VALUES ('#{peep}')")
    redirect '/peeps'
  end

  # get "/add_peep" do
  #   erb :peep
  # end
  #
  # post "/newpeep" do
  #   @message = params[:peep]
  #   erb :post_peep
  # end

  run! if app_file == $0

end
