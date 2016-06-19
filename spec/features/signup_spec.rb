feature "sign up" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_content 'kennbarr'
  end

  scenario "signup prevented when passwords do not match" do
    sign_up_unmatched_passwords
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content 'Passwords did not match'
  end

  scenario "signup prevented when username taken" do
    create_user
    sign_up
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content 'This username is already taken'
  end

  scenario "signup prevented when email taken" do
    create_user
    sign_up
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content 'This email address is already taken'
  end
end
