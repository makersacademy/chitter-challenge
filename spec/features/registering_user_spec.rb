require 'spec_helper'

feature 'registering users' do

  scenario 'sign up a user' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
