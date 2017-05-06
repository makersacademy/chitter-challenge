feature 'New user signs up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Welcome, Frodo Baggins'
    expect(User.first.name).to eq 'Frodo Baggins'
  end
end
