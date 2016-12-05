feature 'User signs out' do

  before(:each) do
    User.create(email: 'bryony@bryony.com',
                password: 'oranges',
                name: 'bryony',
                username: 'bryorama',
                password_confirmation: 'oranges')
  end

  scenario 'while being signed in' do
    sign_in(email: 'bryony@bryony.com', password: 'oranges')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, bryony@bryony.com')
  end

end
