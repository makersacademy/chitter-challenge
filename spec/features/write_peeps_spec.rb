feature 'Features - Write peeps' do
  scenario 'user sends a peep on chitter' do
    user = User.create(username: 'test', name: 'rspec', password: '1234',
      email: 'test@email.com')
    visit('/login')
    fill_in :username, with: 'test'
    fill_in :password, with: '1234'
    click_button 'Submit'
    click_button 'See peeps'
    fill_in :peep, with: 'my first peep, hurray!'
    click_button 'Submit'
    expect(page).to have_content('my first peep, hurray!')
  end
end
