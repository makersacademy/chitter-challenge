feature 'sign_up' do
  scenario 'user signs up on first visit' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('John Doe')
    expect(User.first.email).to eq('john.doe@gmail.com')
  end
  scenario 'user types confirmation incorrectly' do
    expect { sign_up(password_confirmation: 'blabla') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation do not match')
  end
  scenario 'user forgets to enter email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
  scenario 'user forgets to enter full name' do
    expect { sign_up(full_name: nil) }.not_to change(User, :count)
  end
  scenario 'user forgets to enter username' do
    expect { sign_up(user_name: nil) }.not_to change(User, :count)
  end
  scenario 'user enters incorrect email address' do
    expect { sign_up(email: "test@hello") }.not_to change(User, :count)
  end
end
