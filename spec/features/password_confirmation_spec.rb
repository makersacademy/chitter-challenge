require 'spec_helper'

RSpec.feature 'password confirmation' do
  scenario 'mismatching password error' do
    expect { sign_up(password_confirmation: 'passwort')}.to change(User, :count).by(0)
    expect(page).to have_content('Password missmatch')
  end
end
