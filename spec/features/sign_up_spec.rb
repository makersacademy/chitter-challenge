require 'spec_helper'

feature 'signing up' do
  scenario 'a user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
