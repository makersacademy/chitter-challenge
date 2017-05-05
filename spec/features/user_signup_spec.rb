feature 'Registers users' do
  scenario 'a new user registers to the website' do
    expect{ signup }.to change(User, :count).by(1)
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Welcome to Chitter, Sophie!')
  end
  scenario 'user fills in password confirmation incorrectly' do
    expect { signup(password_confirmation: "error") }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Password and confirmation do not match")
  end
  scenario 'user cannot sign up without email' do
    expect { signup(email: "") }.to change(User, :count).by(0)
  end
  scenario 'user cannot sign up with invalid email' do
    expect { signup(email: "invalid@email") }.to change(User, :count).by(0)
  end
  scenario 'user cannot sign up with already registered email address' do
    signup
    expect { signup }.to change(User, :count).by(0)
    expect(page).to have_content("Email is already registered")
  end
end
