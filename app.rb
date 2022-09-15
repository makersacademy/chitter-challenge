require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Application < Sinatra::Base
  get '/' do
    @peep = Peep.joins(:user)
    return erb(:peeps)
  end

  # currently defaults all peeps to user_id 1 
  post '/peeps' do
    Peep.create(
      content: params[:content],
      user_id: 1
    )
    @peep = Peep.joins(:user).order(created_at: :desc)
    return erb(:peeps)
  end
end 



