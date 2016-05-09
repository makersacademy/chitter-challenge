feature "signing up" do

  scenario "sign up with valid credentials" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Hello Amy!"
    expect(User.first.email).to eq("amy@gmail.com")
  end

  scenario "sign up with blank fields" do
    params = {name: nil,
              username: nil,
              email: nil,
              password: "my_password",
              password_confirmation: "my_password"}
    expect { sign_up(params) }.to change(User, :count).by(0)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Name must not be blank Username must not be blank"\
                                 " Email must not be blank"
  end

  scenario "sign up with invalid email" do
    params = {name: "Amy",
              username: "amynic",
              email: "amy@gmail",
              password: "my_password",
              password_confirmation: "my_password"}
    expect { sign_up(params) }.to change(User, :count).by(0)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "sign up with already taken username" do
    params = {name: "Amy1",
              username: "amynic",
              email: "amy@gmail1.com",
              password: "my_password",
              password_confirmation: "my_password"}
    sign_up(params)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Username is already taken"
  end

  scenario "sign up with already taken email" do
    params = {name: "Amy",
              username: "amynic1",
              email: "amy@gmail.com",
              password: "my_password",
              password_confirmation: "my_password"}
    sign_up(params)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end

  scenario "sign up with mismateched passwords" do
    params = {name: "Amy",
              username: "amynic1",
              email: "amy@gmail.com",
              password: "my_password",
              password_confirmation: "not_my_password"}
    expect { sign_up(params) }.to change(User, :count).by(0)
    expect(page).to have_content "Password does not match the confirmation"
  end
end
