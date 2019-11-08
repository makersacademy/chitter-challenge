require "sinatra/base"

class Chitter < Sinatra::Base
  get "/" do
    redirect :'/homepage'
  end

  get "/homepage" do
    @peeps = [
      "This is a test Peep! Peep Peep Peep!",
      "This is a second, even longer, test Peep! Peep Peep Peep!",
    ]

    erb :'chitter/homepage'
  end

  run! if app_file == $0
end
