require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/test" do
    erb :testing_index
  end

  get "/add_peep" do
    erb :peep
  end

  post "/newpeep" do
    @peeps = params[:peep]
    erb :post_peep
  end

  get "/peep" do

  end

  run! if app_file == $0

end
