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
    visit('/chitter')
    click_button('Log in')
    fill_in('username', :with => 'JohnSmith3000')
    fill_in('password', :with => 'password')
    click_button('Log in')
    expect(page.status_code).to eq 200
  end
end
