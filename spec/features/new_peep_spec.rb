feature 'New Peep!' do
  scenario 'A user can add a new peep by clicking the New Peep button' do
    User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')

    visit '/sessions/login'
    fill_in(:username, with: '@pusheen')
    fill_in(:password, with: 'pusheen-password')
    click_button('Log in!')

    click_link('New Peep!')
    fill_in('Message', with: 'New peep by Pusheen!')
    click_button('Add Peep!')

    expect(page).to have_content 'New peep by Pusheen!'
  end
end