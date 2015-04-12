get '/tags/:text' do
  tag = Tag.first(text: params[:text])
  @convos = tag ? tag.convo : []
  erb :home
end