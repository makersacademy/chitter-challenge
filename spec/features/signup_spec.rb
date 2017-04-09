feature 'User is able to sign up' do
  scenario 'User signs up with email, password, name and username' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Welcome")
    expect(User.first.email).to eq('a@gmail.com')
    expect(User.first.name).to eq('Amelie')
    expect(User.first.username).to eq('A-dawg')
  end
end
