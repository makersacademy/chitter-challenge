feature 'you can sign up to chitter' do
  scenario 'I should be notified when I have successfully signed up' do
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Squirrel'
    fill_in 'email', with: 'here@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(page).to have_content 'Congratulations on signing up to Chitter!'
  end
end