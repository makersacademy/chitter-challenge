feature 'User is able to sign up' do
  scenario 'User signs up with email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Welcome")
    expect(User.first.email).to eq('a@gmail.com')
  end
end
