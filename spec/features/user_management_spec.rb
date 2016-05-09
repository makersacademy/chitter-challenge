feature 'new accounts can be set up' do
  scenario 'a create account button exists on the home page' do
    visit '/'
    expect(page).to have_button('join chittr')
  end
  scenario 'clicking the create account button redirects the user' do
    visit '/'
    click_button('join chittr')
    expect(page).to have_content('your account details')
  end
end

feature 'creating a new user' do
  scenario 'a user can create an account' do
    expect {create_an_account}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alice Wonderland')
    expect(User.first.email).to eq('alice@lookingglass.com')
  end
end

feature 'Password confirmation' do
  scenario 'requires a matching confirmation password' do
    expect { create_an_account(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/new_account')
    expect(page).to have_content 'Password does not match the confirmation'
  end
end

feature 'Can\'t create an account if fields are blank' do
  scenario "name field is blank" do
    expect { create_an_account(name: nil) }.not_to change(User, :count)
  end
  scenario "email address field is blank" do
    expect { create_an_account(email: nil) }.not_to change(User, :count)
  end
  scenario "handle field is blank" do
    expect { create_an_account(handle: nil) }.not_to change(User, :count)
  end
end

feature 'Email address must be valid' do
  scenario "I can't sign up with an invalid email address" do
    expect { create_an_account(email: "invalid@email") }.not_to change(User, :count)
  end
end

feature 'New user fields must be unique' do
  scenario 'I cannot sign up with an existing email' do
    create_an_account
    expect { create_an_account }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Handle is already taken')
  end
end
