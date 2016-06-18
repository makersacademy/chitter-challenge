feature 'Sign out' do

  let!(:registered_user) { User.create(email: 'enzo@email.com',
                                      name: 'Crescenzo D\'Alterio',
                                      username: 'alterenzo',
                                      password: 'secure_password',
                                      password_confirmation: 'secure_password')}

  scenario 'log out button doesn\'t appear when no user is logged in' do
    visit '/'
    expect(page).not_to have_content 'Sign Out'
  end

  scenario 'user info doens\'t appear after log out' do
    sign_in(email: 'enzo@email.com', password: 'secure_password')
    click_button 'Sign Out'
    expect(page).not_to have_content 'Welcome, alterenzo'
  end
end
