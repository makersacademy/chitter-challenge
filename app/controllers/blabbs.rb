post '/blabbs' do
  message = params['message']
  Blabb.create(message: message, user_id: current_user.id)
  # current_user.blabbs.create(message: message)
  redirect to('/')
end

get '/blabbs/new' do
  erb :'blabbs/new'
end