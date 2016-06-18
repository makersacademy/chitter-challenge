require 'spec_helper'

feature 'sign up' do
  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong')}. not_to change(Users, :count)
  end
end
