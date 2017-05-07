feature 'New user signs up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Welcome, Frodo Baggins'
    expect(User.first.name).to eq 'Frodo Baggins'
  end

  scenario 'Gets password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content "Uh-oh, the passwords don't match"
  end

  scenario "Can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

end
