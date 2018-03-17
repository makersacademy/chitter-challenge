feature 'Post message' do
  scenario 'Post a message and see it on the homepage' do
    visit('/')
    fill_in('message', with: 'I am a message')
    click_button('Submit')
    expect(page).to have_content('I am a message')
  end
end
