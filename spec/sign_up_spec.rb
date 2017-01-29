
feature "sign up to Chitter" do
  scenario "it allows users to sign up using their name, email, username and password" do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario "it prevents users from signing up if their email has already been registered" do
    sign_up
    expect { sign_up_with_used_email }.not_to change(User, :count)
  end

  scenario "it prevents users from signing up if their username has already been registered" do
    sign_up
    expect { sign_up_with_used_username}.not_to change(User, :count)
  end
end
