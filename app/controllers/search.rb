get '/search/users' do
  @user = User.first(username: params[:user])
  @notes_to_show = Note.all(user_id: @user.id)
  Reply.all(user_id: @user.id).each do |reply|
    @notes_to_show << Note.first(id: reply.note_id)
  end
  @notes_to_show.uniq!
  @header = "Showing all posts by #{@user.full_name}"
  erb :'search/results'
end

get '/search/tags' do
  tag = Tag.first(name: params[:tag])
  @notes_to_show = tag.notes
  tag.replies.each { |reply| @notes_to_show << reply.note }
  @notes_to_show.uniq!
  @header = "Showing all posts with tag ##{tag.name}"
  erb :'search/results'
end