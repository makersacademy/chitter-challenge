feature 'User sign up' do

  scenario 'users/new page loads correctly' do
    visit '/users/new'
    expect(page.status_code).to eq 200
  end

  scenario 'user can sign up with an email, password, name and username' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, alicetest")
    expect(User.first.email).to eq('alice@test.com')
  end

  scenario 'requires a matching password and password_confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user can't sign up without entering an email address" do
    expect { sign_up(email: "") }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "user can't sign up without entering a name" do
    expect { sign_up(name: "") }.not_to change(User, :count)
    expect(page).to have_content 'Name must not be blank'
  end

  scenario "user can't sign up without entering a username" do
    expect { sign_up(username: "") }.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario "user can't sign up with an existing email" do
    sign_up
    expect { sign_up(username: 'Alice Second') }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario "user can't sign up with an existing username" do
    sign_up
    expect { sign_up(email: 'alice@second.com') }.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end