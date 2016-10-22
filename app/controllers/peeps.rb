post '/peeps' do
  time = Time.now
  Peep.create(
    peep: params[:peep],
    time: time,
    user: current_user
  )
  redirect to('/')
end
