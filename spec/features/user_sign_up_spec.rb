feature "user sign up" do

  before do |example|
    unless example.metadata[:skip_before]
      user_sign_up
    end
  end

  scenario "signing up and entering as user" do
    expect(current_path).to eq('/')
    expect(page).to have_content "Welcome Ellie W"
  end

  scenario "user count increases by 1", :skip_before do
    expect { user_sign_up }.to change { User.count }.by 1
  end

  scenario "mismatching passwords does not add user to the database" do
    expect { user_sign_up_wrong_password }.to change { User.count }.by 0
    expect(current_path).to eq('/user')
    expect(page).to have_content "Your passwords do not match!"
  end

  scenario "existing usernames cannot be used to sign up" do
    expect { user_sign_up_diff_email }.to change { User.count }.by 0
    expect(page).to have_content "Username is already taken"
  end

  scenario "existing emails cannot be used to sign up" do
    expect { user_sign_up_diff_username }.to change { User.count }.by 0
    expect(page).to have_content "Email is already taken"
  end

  scenario "users cannot sign up without an email in a valid format" do
    expect { user_sign_up_wrong_email_format }.to change { User.count }.by 0
  end

  scenario "users cannot sign up without entering an email and username" do
    expect { user_sign_up_with_nil }.to change { User.count }.by 0
  end

end
