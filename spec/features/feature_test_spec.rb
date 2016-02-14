feature 'Sign up' do
  scenario 'visit and sign up to chitter' do
    signup
    expect(page.status_code).to eq 200
    #expect(page).to have_content('You have registered for chitter')
  end
end
feature 'Log in'do
  scenario 'visit and log in to chitter'do
    signup
    login
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome JohnSmith3000')
  end
end
feature 'Peeping'do
  scenario 'first peep'do
    signup
    login
    click_button('Peep!')
    fill_in('peep', :with => 'This is a peep, dudes!')
    click_button('Peep!')
    expect(page).to have_content 'This is a peep, dudes!'
  end
end
