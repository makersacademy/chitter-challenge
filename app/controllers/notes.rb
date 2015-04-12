post '/notes/add' do
  Note.create content: params[:note],
              created_at: Time.now,
              user_id: current_user.id
  redirect '/'
end