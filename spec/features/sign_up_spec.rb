feature 'sign up' do
  scenario 'user successfully registers' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
  end

  scenario 'user does not enter a first name' do
    expect { sign_up(first_name: nil) }.not_to change { User.count }
  end

  scenario 'user does not enter a last name' do
    expect { sign_up(last_name: nil) }.not_to change { User.count }
  end

  scenario 'user does not enter a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
  end

  scenario 'user enters a username that is already taken' do
    sign_up
    expect { sign_up(email: 'dv@gmail.com', username: "Darth Vader") }.not_to change { User.count }
  end
end
