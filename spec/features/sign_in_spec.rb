feature "User sign in" do

  let!(:user) do
    User.create(email: 'baseline@rally.com',
                password: 'pop1',
                password_confirmation: 'pop1')
    end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
