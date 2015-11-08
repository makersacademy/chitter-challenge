require 'web_helpers'

feature 'sign up' do
  scenario 'can access the sign up page' do
    expect { sign_up(email: "invalid@email") }.not_to change{ User.count }
  end
end
