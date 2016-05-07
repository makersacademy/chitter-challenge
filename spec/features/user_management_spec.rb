feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('alice@example.com')
  end
  scenario 'confirmation of password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end
  scenario "can't sign up without an email address" do
    expect { sign_up(email:nil, password:nil) }.not_to change(User, :count)
  end
  scenario "can't sign up with an invalid email address" do
    expect { sign_up(email:"invalid@email") }.not_to change(User, :count)
    expect { sign_up(email:"invalidemail.") }.not_to change(User, :count)
  end
  scenario "can't sign up with the same email address twice" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
