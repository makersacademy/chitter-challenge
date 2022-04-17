feature 'Post Peep' do
  before do
    User.create(
      email: 'test@example.com',
      password: 'test123',
      name: 'Tester Test',
      username: 'TTest'
    )
    visit('/sessions/new')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'test123'
    click_button('Sign in')
  end

  scenario 'User can write a Peep that can be seen on Chitter' do
    visit('/peeps')
    click_button('New Peep')
    fill_in :peep, with: "Hey guys! I'm new"
    click_button('Peep!')
    expect(page).to have_content("Hey guys! I'm new")
  end

  scenario 'User can see the time the Peep was created' do
    visit('/peeps')
    click_button('New Peep')
    fill_in :peep, with: "Hey guys! I'm new"
    click_button('Peep!')
    expect(page).to have_content(Date.today)
  end
end
