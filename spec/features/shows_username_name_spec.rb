feature 'shows username and name next to messages' do 
  scenario 'username and name are shown next to messages on index page' do 
    signup

    visit '/messages/new'
    fill_in('content', with: 'this is first message')
    click_button('Submit')

    expect(page).to have_content('alexchen')
    expect(page).to have_content('alex')

  end 
end
