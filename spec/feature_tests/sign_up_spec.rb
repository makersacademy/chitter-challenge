feature 'User login' do
  scenario 'should be able to visit the sign up page and login' do
    expect { log_in }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, 12345@live.xyz"
  end

end
