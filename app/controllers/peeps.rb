post '/peeps' do
  text = params[:text]
  user_id = session[:user_id]
  time = Time.now
  Peep.create(text: text, time: time, user_id: user_id)
  redirect to('/')
end