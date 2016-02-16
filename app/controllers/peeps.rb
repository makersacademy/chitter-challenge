class ChitterApp < Sinatra::Base

    get '/' do
      erb :peeps
    end

    post '/peeps/new' do
      flash.keep[:length] = "Message too long!" if params[:message].length > 140
      # move peep into current_user?
      Peep.create(message: params[:message],
                  author: current_user.real_name,
                  handle: current_user.username,
                  time: Time.now)

      # prevent invalid peep creation?
      redirect to '/'
    end


end
