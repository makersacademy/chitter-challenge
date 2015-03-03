
post '/peeps' do 
  Peep.create(
    :content => params[:content],
    :created_at => Time.now,
    :user => current_user 
  )
  redirect to('/')
end 