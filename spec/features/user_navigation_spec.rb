feature 'A user can navigate' do
  scenario 'a user can return to the homepage' do
    visit('/chitter')
    click_button('Sign up')
    expect(page).to have_content 'Sign up for Chitter!'
  end

  scenario 'a user can return to the homepage' do
    Peep.create(peep: 'A lovely day', time: 'now')
    visit('/users/new')
    click_button('Home')
    expect(page).to have_content 'A lovely day'
  end

  scenario 'a user can return to the homepage' do
    visit('/chitter')
    click_button('Sign in')
    expect(page).to have_content 'Sign in!'
  end
end
