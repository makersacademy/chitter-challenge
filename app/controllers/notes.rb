post '/notes/add' do
  note = Note.create content: params[:note],
                     created_at: Time.now,
                     updated_at: Time.now,
                     user_id: current_user.id
  note.save_tags
  redirect '/'
end

post '/notes/reply' do
  reply = Reply.create content: params[:reply],
                       created_at: Time.now,
                       user_id: current_user.id,
                       note_id: params[:'reply-to']
  note = Note.get(params[:'reply-to'])
  note.update updated_at: Time.now
  note.replies << reply
  note.save
  reply.save_tags
  redirect '/'
end