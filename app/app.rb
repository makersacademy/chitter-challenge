require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = [
      {username: "@durov", body: "Telegram v5.0 is out now!", time: "2020-08-10 11:54:55"},
      {username: "@trump", body: "BUILD THE WALL!", time: "2020-10-10 12:35:50"}
    ]
    @sorted_peeps = @peeps.sort_by { |peep| peep[:time] }

    erb(:index)
  end

  run! if app_file == $0
end
