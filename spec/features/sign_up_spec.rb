feature 'Users can sign up for Chitter' do

  scenario 'User is taken to sign_up page from "/" ' do
    visit('/peeps/index')
    click_button('Sign up')
    expect(page).to have_current_path('/user/new')
  end

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Logged in as: Magnus")
    expect(User.first.email).to eq("mail@magnusholm.com")
  end

end
