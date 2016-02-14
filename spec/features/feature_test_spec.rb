feature 'Sign up' do
  scenario 'visit and sign up to chitter' do
    signup
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign up was successful!')
  end
  scenario 'no multiple registrations'do
    signup
    visit('/chitter')
    click_button('Log out')
    signup
    expect(page).to have_content('Sorry, that email or username has already been used. Please try again')
  end
end

feature 'Log in'do
  scenario 'visit and log in to chitter'do
    signup
    visit('/chitter')
    click_button('Log out')
    login
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome JohnSmith3000')
  end
end

feature 'Peeping'do
  scenario 'first peep'do
    signup
    visit('/chitter')
    click_button('Peep!')
    fill_in('peep', :with => 'This is a peep, dudes!')
    click_button('Peep!')
    expect(page).to have_content 'This is a peep, dudes!'
  end
end

feature 'Check peep profiles'do
  scenario 'click on a name to see a peep history'do
  signup
  visit('/chitter')
  click_button('Peep!')
  fill_in('peep', :with => 'This is a peep, dudes!')
  click_button('Peep!')
  click_link('JohnSmith3000')
  expect(page).to have_content 'This is a peep, dudes!'
  end
end
