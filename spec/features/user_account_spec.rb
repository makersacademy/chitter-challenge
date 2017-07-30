feature 'user accounts' do
  scenario 'user can sign up for an account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, example@example.com"
    expect(User.first.email).to eq "example@example.com"
  end
end
