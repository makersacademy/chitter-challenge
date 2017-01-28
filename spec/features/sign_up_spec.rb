feature 'Sign up' do
  scenario 'I can sign up for an account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, Cloud Strife'
  end
  scenario 'I can\'t sign up for an account twice with the same email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
  scenario 'I need to enter matching passwords to sign up for an account' do
    expect { sign_up_pw_not_match }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
