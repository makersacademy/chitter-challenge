feature 'User sign in' do
  scenario 'with correct credentials' do
    sign_up
    sign_in
    expect(page).to have_content("Welcome to Chitter, ghost!")
  end

  scenario "User can't log in with incorrect password" do
    sign_up
    sign_in( password:  'wrong')
    expect(current_path).to eq('/sessions')
    expect(page).to have_content('The email or password is incorrect')
  end
end
