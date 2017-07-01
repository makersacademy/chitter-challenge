feature 'User Sign up' do
  scenario 'Can sign up for an account' do
    visit '/users/new'
    fill_in :username, with: "tom"
    fill_in :email, with: "tom@test.com"
    fill_in :password, with: "Secret01"
    fill_in :password_confirmation, with: "Secret01"

    expect(User.count).to eq 1
    expect(page).to have_content "Signed in as tom"
  end

  # expect(page.current_path).to eq '/peeps'
end
