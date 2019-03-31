feature 'messages index without sign in' do 
  scenario 'it displays messages without sign in' do
    # can i incorporate model methods here?
    user = User.create(name: 'alex', username: 'alexchen', email: 'alex@hotmail.com', password: '12345678')
    # p user.id
  
    Message.create(content: 'hello', user_id: user.id)

    visit '/messages' 
    # save_and_open_page 
    expect(page).to have_content('hello')
  end
end
