feature 'Users can sign up for Chitter' do

  scenario 'User is taken to sign_up page from "/" ' do
    visit('/peeps/index')
    click_button('Sign up')
    expect(page).to have_current_path('/user/new')
  end

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Successfully logged in as: Magnus")
    expect(User.first.email).to eq("mail@magnusholm.com")
  end

  scenario 'User can not sign up with the same email adress' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

end
