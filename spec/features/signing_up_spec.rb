feature 'Signing up' do
  scenario 'a user can join Chitter' do
    visit './peeps'
    click_button 'Sign Up'
    fill_in 'name', with: 'Bob'
    fill_in 'username', with: 'BobBamBoom'
    fill_in 'email', with: 'Bob@example.com'
    fill_in 'password', with: 'Banana123'
    click_button 'Join'

    expect(page).to have_content 'Welcome, BobBamBoom!'
  end
end
