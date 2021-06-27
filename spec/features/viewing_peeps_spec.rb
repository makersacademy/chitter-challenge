feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end

  scenario 'A user can see peeps' do
    # Add the test data
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
    Peep.create(peep_text: 'This is a peep', user_id: user.user_id)
    Peep.create(peep_text: 'Peep peep!', user_id: user.user_id)
    Peep.create(peep_text: 'peeping away 🐥', user_id: user.user_id)

    visit('/peeps')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "Peep peep!"
    expect(page).to have_content "peeping away 🐥"
  end
end
