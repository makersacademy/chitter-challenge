feature 'Login' do
  scenario 'When a user logs in successfully, a welcome message is displayed on homepage' do
    signup
    login
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome Alex'
  end
end
