feature 'messages index with reverse order' do 
  scenario 'it displays messages in reverse order, with time posted' do
    # can i incorporate model methods here?
    user= User.create(name:'alex', username:'alexchen')
    Message.create(content: 'hello',user_id: user.id )
    visit '/messages' 
    expect(page).to have_content('hello')
  end
end 