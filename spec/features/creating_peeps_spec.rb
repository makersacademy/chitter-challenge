feature 'Adding a new peep' do
  scenario 'use can add a new peep' do
    User.create(
      email: 'user@example.com',
      password: 'password123',
      name: 'Example user',
      username: '@example_user'
    )

    visit '/sessions/new'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'

    click_button 'New Peep'

    fill_in 'body', with: 'my first peep'
    click_button 'Peep'

    expect(page).to have_content 'my first peep'
  end
end
