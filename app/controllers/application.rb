get '/' do
  @notes_to_show = Note.all
  erb :index
end