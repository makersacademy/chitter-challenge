feature 'sign up' do
  scenario 'user successfully registers' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
  end

  scenario 'user does not enter a first name' do
    expect { sign_up(first_name: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'First name must not be blank'
  end

  scenario 'user does not enter a last name' do
    expect { sign_up(last_name: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Last name must not be blank'
  end

  scenario 'user does not enter an email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'user enters an invalid email' do
    expect { sign_up(email: "dv") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'user enters an existing email' do
    sign_up
    expect { sign_up(email: 'darth_vader@gmail.com', username: "DV") }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'user does not enter a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'user enters an existing username' do
    sign_up
    expect { sign_up(email: 'dv@gmail.com', username: "Darth Vader") }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'user enters mismatching passwords' do
    expect { sign_up(password_confirmation: 'hateyoda') }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
