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
    visit '/posts/new'
    fill_in 'content', :with => 'hello world!'
    click_button 'Submit'
    expect(page).to have_content ('Bitterman : hello world!')
  end
end
