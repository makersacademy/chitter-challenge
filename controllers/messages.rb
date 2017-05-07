class Chitter < Sinatra::Base
  post '/messages' do
    @message = Message.new(content: params[:message_content],
                           user_id: session[:user_id],
                           timestamp: Time.now)
    if @message.save
      redirect '/chitter-newsfeed'
    else
      flash.now[:errors] = @message.errors.full_messages
      erb :chitter_newsfeed
    end
  end
end
