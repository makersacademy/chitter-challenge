feature "sign up form" do
  scenario "signing up and entering as user" do
    user_sign_up
    expect(current_path).to eq('/')
  end

  scenario "welcome message is shown if user is logged in" do
    user_sign_up
    expect(page).to have_content("Welcome winnie")
  end

  scenario 'user count increases by 1' do
    expect{ user_sign_up }.to change { User.count }.by 1
  end
end
