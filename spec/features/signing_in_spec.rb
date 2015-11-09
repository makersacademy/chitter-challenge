feature "signing in" do

  let(:user) do
    user = User.create(email: 'coco@gmail.com',
                  password: 'lila',
                  password_confirmation: 'lila',
                  name: 'Julien',
                  user_name: 'coco')
  end

  scenario "with correct email and password" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content 'Welcome, coco'
  end

  scenario "with wrong password" do
    sign_in(email: user.email, password: "wrong password")
    expect(page).to have_content 'The email or password is incorrect'
  end
end
