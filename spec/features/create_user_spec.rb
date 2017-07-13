feature "Creating a user" do
  scenario 'I can create a new user account' do
    expect { new_user }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, example@example.com"
    expect(User.first.email).to eq 'example@example.com'
    expect(User.first.name).to eq 'Example Name'
    expect(User.first.username).to eq 'Example1'
  end

  scenario 'when the password does not match the password confirmation entered' do
    expect { new_user(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "New user cannot sign up without entering an email address" do
    expect { new_user(email: nil) }.not_to change(User, :count)
  end

  scenario "New user cannot sign up with an invalid email address" do
    expect { new_user(email: "invalid@email") }.not_to change(User, :count)
  end  
end
