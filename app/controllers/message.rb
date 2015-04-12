class Chitter

  get '/inbox' do
    @messages = Message.all reciver_id: current_user.id
    erb :"messages/inbox"
  end

  get '/send' do
    following = Follow.all follower: current_user
    @friends = Follow.all follower: following.followed, followed: current_user
    erb :"messages/send"
  end

  post '/send_message' do
    date_time = Time.now
    reciver = User.first(id: params[:reciver])
    Message.create(title: params[:title],
                   date_time: date_time,
                   text: params[:text],
                   sender: current_user,
                   reciver: reciver)
    erb :"messages/success"
  end

end