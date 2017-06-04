feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, andrewclarke982@gmail.com')
    expect(User.first.email).to eq('andrewclarke982@gmail.com')
  end
end
