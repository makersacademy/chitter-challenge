post '/message' do
  title = params['title']
  message = params['message']
  tags = params['tags'].split(' ').map do |tag|
    Tag.first_or_create(text: tag)
  end
  Convo.create(message: message, tags: tags)
  redirect to '/'
end

get '/welcome_message' do
  erb :welcome_message
end
