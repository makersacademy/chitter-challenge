feature 'messages index without sign in' do 
  scenario 'it displays messages without sign in' do
    # can i incorporate model methods here?
    user= User.create(name:'alex', username:'alexchen')

    Message.create(content: 'hello',user_id: user.id )
    visit '/messages' 
    expect(page).to have_content('hello')
  end
end 

