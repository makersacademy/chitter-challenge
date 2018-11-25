feature 'logging out' do
  before(:each) do
    @user = User.register(name: 'Faceless Old Woman', \
      user_name: 'FacelessOW', email: 'mystery@domain.com', \
      password: '123456789')
  end

  scenario 'a user can logout' do
    sign_in
    click_button 'Log out'

    expect(page).to have_content 'You have logged out.'
    expect(page).not_to have_content 'Welcome to Chitter, Faceless Old Woman'
  end
end
