post '/peeps' do
  content = params["content"]
  author = params["author"]
  datetime = DateTime.now
  Peep.create(:content => content, :author => author, :created_at => datetime)
  redirect to ('/')
end