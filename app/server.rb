class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  helpers do

    def current_maker
      Maker.get(session[:maker_id])
    end

    def valid?(password, confirm_password)
      password == confirm_password && password != ''
    end

  end

end
