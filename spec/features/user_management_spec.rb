feature "User sign up" do

  scenario "New users can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alice')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario "require a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario "with a password that doesnt match" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')# current_path is a helper provided by Capybara
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

end
