feature "sign up form" do

  before :each do
    user_sign_up
  end

  scenario "signing up and entering as user" do
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome winnie")
  end

  scenario "user count increases by 1" do
    expect { user_sign_up }.to change { User.count }.by 1
  end
end
