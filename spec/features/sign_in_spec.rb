require 'spec_helper'

RSpec.feature 'sign in', type: :feature do

  let!(:user) do
    User.create(email: 'Dio@test.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "using correct sign in details" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Succesful login, #{user.email}"
  end

end
