feature "User sign in" do

  scenario 'with valid user_name and password' do
    valid_user = create(:user)

    sign_in valid_user

    expect(page).to have_content("#{valid_user.name}")
  end

  xscenario ' with no valid email or password' do
  end

  def sign_in user
    visit '/'

    fill_in 'user_name', with: user.user_name
    fill_in 'password',  with: user.password
    
    click_button 'Sign in'
  end

end


