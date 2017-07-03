feature 'User signs out' do

  before(:each) do
    User.create(email: 'big@easy.com',
                firstname: 'keepo',
                lastname: 'numbawan',
                username: 'monkas',
                password: 'small',
                password_confirmation: 'small')
  end

  scenario 'while being signed in' do
    sign_in(email: 'big@easy.com', password: 'small')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, big@easy.com')
  end

end
