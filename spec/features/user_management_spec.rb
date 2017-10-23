feature 'User management' do
  scenario 'I can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, Lucas"
    expect(User.first.username).to eq 'Lucas'
  end
  scenario 'checks passwords match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario "I can't sign up with a blank email" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end
  scenario "I can't sign up with an invalid email" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end
  scenario "I cannot sign up with an existing email" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

end
