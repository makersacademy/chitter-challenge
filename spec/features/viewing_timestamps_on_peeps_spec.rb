feature 'Viewing timestamps' do
  scenario 'A user can see timestamps for peeps' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
    Peep.create(peep_text: 'peeping away 🐥', user_id: user.user_id)
    time_now = Time.now.strftime "%Y-%m-%d %H:%M:%S"
    # Can't use timecop to freeze time?
    time_now_variance = (Time.now + 1).strftime "%Y-%m-%d %H:%M:%S"
    visit('/peeps')

    expect(page).to have_content("#{time_now} Test Name (@testuser1): peeping away 🐥").or have_content("#{time_now_variance} Test Name (@testuser1): peeping away 🐥")
  end

  scenario 'peeps are in reverse chronological order' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
    Peep.create(peep_text: 'This is a peep', user_id: user.user_id)
    Peep.create(peep_text: 'Peep peep!', user_id: user.user_id)
    Peep.create(peep_text: 'peeping away 🐥', user_id: user.user_id)

    visit('/peeps')

    expect(page.find('li:nth-child(1)')).to have_content 'peeping away 🐥'
    expect(page.find('li:nth-child(2)')).to have_content 'Peep peep!'
    expect(page.find('li:nth-child(3)')).to have_content 'This is a peep'
  end
end
