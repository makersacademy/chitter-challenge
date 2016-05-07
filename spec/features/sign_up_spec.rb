feature "signing up" do
  scenario "sign up with valid credentials" do
    params = {name: "Amy",
              username: "amynic",
              email: "amy@gmail.com",
              password: "my_password"}
    sign_up(params)
    expect(page).to have_content "Hello Amy!"
  end

  scenario "sign up with blank fields" do
    params = {name: nil,
              username: nil,
              email: nil,
              password: "my_password"}
    sign_up(params)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content "Name must not be blank Username must not be blank"\
                                 " Email must not be blank"
  end

  scenario "sign up with invalid email" do
    params = {name: "Amy",
              username: "amynic",
              email: "amy@gmail",
              password: "my_password"}
    sign_up(params)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "sign up with already taken email and username" do
    params = {name: "Amy",
              username: "amynic",
              email: "amy@gmail.com",
              password: "my_password"}
    sign_up(params)
    sign_up(params)
    expect(page).to have_content "Username is already taken Email is already taken"
  end
end
