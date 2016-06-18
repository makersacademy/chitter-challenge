feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, somealex')
    expect(User.first.name).to eq('alex')
    expect(User.first.user_name).to eq('somealex')
    expect(User.first.email).to eq('alex@example.com')
  end
end
