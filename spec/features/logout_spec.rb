feature 'User log out' do

  before(:each) do
    User.create(name: 'Daffy Duck',
                username: 'dduck',
                email: 'daffy@test.com',
                password: 'gamma',
                password_confirmation: 'gamma')
  end

  scenario 'User can log out to leave currently logged session' do
    sign_in(email: 'daffy@test.com', password: 'gamma')
    click_button 'Log out'
    expect(page).to have_content('See you soon!')
    expect(page).not_to have_content('Welcome back dduck!')
  end

end
