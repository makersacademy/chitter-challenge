feature 'User Sign up' do
  before do
    sign_up
  end

  scenario 'Can sign up for an account' do
    expect(User.count).to eq 1
    expect(page).to have_content "Signed in as tom"
  end

  scenario 'Sends user to peeps page after registration' do
    expect(page.current_path).to eq '/peeps'
  end
end
