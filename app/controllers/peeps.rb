post '/peeps' do
  text = params[:text]
  Peep.create(text: text)
  redirect to('/')
end