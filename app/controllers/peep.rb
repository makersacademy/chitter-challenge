class Chitter

  post '/insert_peep' do
    date_time = Time.now
    text = params[:peep]
    user = User.first(id: session[:user_id])
    peep = Peep.create(date_time: date_time,
                       text: text,
                       user: user)
    redirect back
  end

end