class Chitter

  post '/comment' do
    date_time = Time.now
    text = params[:text]
    user = User.first(id: session[:user_id])
    peep = Peep.first(id: params[:peep_id])
    peep = Comment.create(date_time: date_time,
                          text: text,
                          user: user,
                          peep: peep)
    redirect to '/'
  end

end