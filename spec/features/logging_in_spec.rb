feature 'logging in' do
  before(:each) do
    @user = User.register(name: 'Faceless Old Woman', \
      user_name: 'FacelessOW', email: 'mystery@domain.com', \
      password: '123456789')
  end

  scenario 'a user can login with email and password' do
    sign_in
    expect(page).to have_content 'Welcome to Chitter, Faceless Old Woman'
  end

  scenario 'email must be valid' do
    visit('/sessions/new')
    fill_in 'email', with: 'fake@fakedomain.com'
    fill_in 'password', with: '123456789'
    click_button 'Log in'

    expect(page).not_to have_content "Welcome to Chitter, Faceless Old Woman"
    expect(page).to have_content "Please check your email or password"
  end
end
