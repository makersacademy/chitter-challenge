feature 'peeps have the name of the maker' do
  scenario 'User can post a peep and it shows their name' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    visit '/peeps'
    click_button 'Sign in'
    fill_in(:username, with: 'chrisc')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    fill_in(:peep, with: "Hello it's chrissy!")
    click_button 'Add a peep'
    expect(page).to have_content "Hello it's chrissy!"
    expect(page).to have_content "posted by Chrissy"
  end
end
