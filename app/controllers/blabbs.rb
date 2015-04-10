post '/blabbs' do
  message = params['message']
  Blabbs.create(message: message)
  redirect to('/')
end

get '/blabbs/new' do
  erb :'links/new'
end