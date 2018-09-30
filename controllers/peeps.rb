require 'sinatra/base'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  post '/peeps' do
    unless params[:peep_text].empty?
      settings.peep_feed.post_peep(settings.current_user, params[:peep_text])
    end
    redirect '/'
  end
end
