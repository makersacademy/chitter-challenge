feature 'sign-up / register' do
  scenario 'user signs up' do
    visit '/register'
    fill_in 'username', :with => 'Bitterman'
    fill_in 'password', :with => 'awdwadawdqwe123ew'
    click_button 'Submit'
    expect(page).to have_content('Log in')
  end
end
