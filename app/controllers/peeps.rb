
post '/peeps' do 
  Peep.create(
    :content => params[:content],
    :user => current_user 
  )
  redirect to('/')
end 