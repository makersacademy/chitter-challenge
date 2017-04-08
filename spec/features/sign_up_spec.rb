feature 'User sign up' do
  scenario 'Able to sign up as a new user' do
    expect(current_path).to eq '/peeps'
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, echai93@gmail.com')
    expect(User.first.email).to eq('echai93@gmail.com')
  end
end
