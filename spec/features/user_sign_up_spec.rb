feature "sign up form" do

  before do |example|
    unless example.metadata[:skip_before]
      user_sign_up
    end
  end

  scenario "signing up and entering as user" do
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome Ellie W")
  end

  scenario "user count increases by 1" do
    expect { user_sign_up }.to change { User.count }.by 1
  end

  scenario "mismatching passwords throws an error and does not add user to the database", :skip_before do
    user_sign_up_wrong_password
    expect { user_sign_up_wrong_password }.to change { User.count }.by 0
  end

end
