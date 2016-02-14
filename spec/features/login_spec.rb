require 'web_helper'

feature "User login" do
  let(:user) do
    User.create(email: 'heather@example.com',
                password: 'chitter',
                password_confirmation: 'chitter')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end


end
