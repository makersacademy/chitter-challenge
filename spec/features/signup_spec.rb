feature 'Signing up' do
  scenario 'user is able to create account' do
    visit '/users/new'
    fill_in 'name', with: "Ed Lowther"
    fill_in 'username', with: "edlowther"
    fill_in 'email', with: 'ed@geemail.com'
    fill_in 'password', with: 'very hard to guess word'
    click_button 'Create account'
    expect(page).to have_content 'Welcome to Chitter, Ed Lowther'
  end
end
