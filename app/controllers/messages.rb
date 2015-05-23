get '/messages/new' do
  if current_user
    @reply_to_id = params[:reply]
    erb :'messages/new'
  else
    flash[:notice] = 'Please login to reply to peeps'
    redirect to '/sessions/new'
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
