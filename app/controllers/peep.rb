require_relative '../helpers/application'
include CurrentUser


post '/peeps' do
  if current_user
    text = params[:peep]
    user = session[:user_id]
    @peep = Peep.create(user_id: user,
                        content: text)
    redirect to('/')
  else
    flash[:errors] = ['You must be logged in to post a peep']
    erb :'sessions/new'
  end
end


post '/messages' do
  message = params[:message]
  user = session[:user_id]
  reply = params[:reply]

  message_save = Message.create(user_id: user,
                                message: message,
                                replies_to_id: reply)
  if message_save.save
    flash[:notice] = 'Your peep was sent successfully!'
    redirect to '/'
  else
    flash[:errors] = message_save.errors.full_messages
    redirect to '/'
  end
end