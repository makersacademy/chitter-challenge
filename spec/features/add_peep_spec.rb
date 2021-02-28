feature 'can add message to timeline' do
  scenario 'without logging in' do

    visit '/'
    fill_in('new_peep', with: 'This is a test message')
    click_button 'submit_new_peep'
    expect(page).to have_content('This is a test message')
    expect(page).to have_content('@anon')

  end

  scenario 'when logged in' do
    User.add(name: 'Pete', username: 'pja', email: 'test@test.com', password: '1234')

    visit '/'
    fill_in('new_peep', with: 'This is another test message')
    click_button 'submit_new_peep'
    expect(page).to have_content('This is another test message')
    expect(page).to have_content('@pja')

  end

end
