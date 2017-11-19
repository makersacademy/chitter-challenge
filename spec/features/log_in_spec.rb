feature 'login' do
  scenario 'requiring email address to sign in' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
