feature 'log-out' do
  scenario 'user signs up, logs in, then logs out' do
    visit '/register'
    fill_in 'username', :with => 'Bitterman'
    fill_in 'password', :with => 'awdwadawdqwe123ew'
    fill_in 'email', :with => 'Bitterman@yahoo.com'
    click_button 'Submit'
    fill_in 'username', :with => 'Bitterman'
    fill_in 'password', :with => 'awdwadawdqwe123ew'
    click_button 'Submit'
    click_button 'Log-out'
    visit '/posts/new'
    expect(page).to have_content 'you must be logged in to post'
  end
end
