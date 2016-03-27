class Chitter < Sinatra::Base
    get '/log-in' do
      erb :'log_in/log_in'
    end

    post '/log-in' do
      user = User.first(email: params[:email])
      if user.nil?
        flash.now[:error] = ["User does not exist!"]
        erb :'log_in/log_in'
      elsif user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to('/chitter_feed')
      else
        flash.now[:error] = user.errors.full_messages
        erb :'log_in/log_in'
      end
    end
end
