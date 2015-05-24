get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  message = params[:message]

  @peep = Peep.create(message: message, user_id: current_user.id)
  redirect to('/')
end