feature 'Welcome page' do
  scenario 'User enters page and has button for adding tweet' do
    visit('/')
    fill_in 'peep', with: 'What is on your mind?'
    click_button 'Send it!'

    expect(page).to have_content 'What is on your mind?'
  end
end 



