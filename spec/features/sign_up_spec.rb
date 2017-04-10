feature 'User sign up' do
  scenario 'with no errors' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Logged in as Darth_Vader'
  end

  scenario 'without entering a first name' do
    expect { sign_up(first_name: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'First name must not be blank'
  end

  scenario 'without entering a last name' do
    expect { sign_up(last_name: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Last name must not be blank'
  end

  scenario 'without entering an email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with an invalid email' do
    expect { sign_up(email: "dv") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'with an existing email' do
    sign_up
    expect { sign_up(email: 'darth_vader@gmail.com', username: "DV") }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'without entering a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'with an existing username' do
    sign_up
    expect { sign_up(email: 'dv@gmail.com', username: "Darth_Vader") }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'with mismatching passwords' do
    expect { sign_up(password_confirmation: 'hateyoda') }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
