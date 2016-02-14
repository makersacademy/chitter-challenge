feature 'User Sign Up' do
  scenario 'A user signs up with credentials' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Buoyant Bobba')
    expect(User.first.email).to eq('bobb@fett.com')
  end
end
