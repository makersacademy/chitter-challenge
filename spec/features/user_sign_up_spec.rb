feature 'a user can sign up for Chitter' do
  scenario 'user enters an email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, chazzas@hotmail.com')
    expect(User.first.email).to eq('chazzas@hotmail.com')
  end

end
