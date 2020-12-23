feature 'user can post' do
  scenario 'shows which user has posted each peep' do
    User.sign_up(username: "Tester One", email: 'no@email.com')
    User.sign_up(username: "Tester Two", email: 'no@email.com')

    visit '/chitter'

    expect(page).to have_selector(id: 'select_user', text: 'Tester One')
    expect(page).to have_selector(id: 'select_user', text: 'Tester Two')
  end
end
