class Chitter < Sinatra::Base
  
  register Sinatra::Flash
  enable :sessions

  helpers do

    def current_maker
      Maker.get(session[:maker_id])
    end

  end

end
