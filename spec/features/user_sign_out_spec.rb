feature 'User signs out' do

  before(:each) do
      User.create(name: 'Sity',
                  username: 'sitypop',
                  email: 'sity@ilovefalafel.com',
                  password: 'secret',
                  password_confirmation: 'secret')
  end

  xscenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).not_to have_content("Oh hi there sitypop!")
  end

end
