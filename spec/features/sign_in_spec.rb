feature 'sign-in' do
  scenario 'user signs up and logs in' do
    visit '/register'
    fill_in 'username', :with => 'Bitterman'
    fill_in 'password', :with => 'awdwadawdqwe123ew'
    fill_in 'email', :with => 'Bitterman@yahoo.com'
    click_button 'Submit'
    fill_in 'username', :with => 'Bitterman'
    fill_in 'password', :with => 'awdwadawdqwe123ew'
    click_button 'Submit'
    expect(page).to have_content 'Welcome Bitterman!'
  end
end
