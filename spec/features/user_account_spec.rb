feature 'user accounts' do
  scenario 'user can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, example@example.com"
    expect(User.first.email).to eq "example@example.com"
  end

  scenario 'user cannot sign up with an incorrect password' do
    expect { sign_up(password_confirmation: 'exanple') }.not_to change(User, :count)
  end
end
