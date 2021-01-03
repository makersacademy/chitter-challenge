feature 'viewing peeps' do
  scenario 'shows peeps in reverse chronological order' do
    user = User.sign_up(username: 'Kiki', email: 'kiki@chitter.com')
    Peep.create(text: 'First tester', user_id: user.id)
    Peep.create(text: 'Second tester', user_id: user.id)
    Peep.create(text: 'Third tester', user_id: user.id)

    visit '/chitter'

    expect(page).to have_selector(id: '1', text: 'Third tester')
    expect(page).to have_selector(id: '2', text: 'Second tester')
    expect(page).to have_selector(id: '3', text: 'First tester')
  end

  scenario 'shows timestamp of peep' do
    user = User.sign_up(username: 'Kiki', email: 'kiki@chitter.com')
    Peep.create(text: 'Timestamp tester', user_id: user.id)

    visit '/chitter'

    expect(page).to have_content Time.now
  end
end
