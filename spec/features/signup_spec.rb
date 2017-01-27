require 'spec_helper'

feature 'Sign up' do

  scenario 'can register new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('You are logged in as eric@example.com')
    expect(User.first.email).to eq('eric@example.com')
  end
end

#
# scenario 'fails if confirmation password doesn\'t match' do
#   expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
# end
# end
