require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/test" do
    erb :testing_index
  end

  run! if app_file == $0

end
