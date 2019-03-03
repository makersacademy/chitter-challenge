require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    peeps = [
      '2019-03-03; 14:52; The peep at the top of the page is the most recent', 
      '2019-03-02; 10:45; Homepage shows peeps in reverse chronological order', 
      '2019-03-02; 10:34; On Chitter, we post messages called "Peeps"'
    ]

    peeps.join
  end

  run! if app_file == $0
end
