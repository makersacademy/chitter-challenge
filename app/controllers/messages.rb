get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  message = params[:message]
  user = session[:user_id]
  message_save = Message.create(user_id: user, message: message)
  if message_save.save
    flash[:notice] = 'Your peep was sent successfully!'
    redirect to '/'
  else
    flash[:errors] = message_save.errors.full_messages
    redirect to '/'
  end
end
