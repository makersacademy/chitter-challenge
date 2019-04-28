feature 'loads chitter home page' do
  scenario 'user accesses chitter home page' do
    visit ('/')
    expect(page).to have_content('Welcome to Chitter!')
  end
end 

feature 'message board' do
  scenario 'user posts a message and it is shown on the screen' do
    visit ('/message')
    fill_in "message", :with => 'Message has been sent'
    click_on('Submit')
    expect(page).to have_content('Message has been sent')
  end
end

feature 'message board with 2 messages' do
  scenario 'user posts another message and both messages are shown on the screen' do
    visit ('/message')
    fill_in "message", :with => 'Message has been sent'
    click_on('Submit')
    fill_in "message", :with => 'Message 2 has been sent'
    click_on('Submit')
    expect(page).to have_content('Message has been sent')
    expect(page).to have_content('Message 2 has been sent')
  end
end