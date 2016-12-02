feature 'Signing up' do

  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.name).to eq('John Smith')
    expect(User.first.email).to eq('jsmith@gmail.com')
    expect(User.first.username).to eq('jsmith2016')
  end

  scenario 'Passwords must match' do
    expect { sign_up(password_confirmation: "incorrect") }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
  end

  scenario 'Need to enter a valid email' do
    expect { sign_up(email: "not an email") }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Need to fill in email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'No duplicate emails or username' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end

  scenario 'Need to fill in username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'Need to fill in name' do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Name must not be blank')
  end

end
