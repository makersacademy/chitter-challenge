require 'spec_helper'
require_relative 'helpers/user_accounts'

include UserAccountHelpers

feature 'signing up' do

  scenario 'user signs up with a new email address' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Hello, Joe")
  end

  scenario 'user signs up with an already-used email address' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content("already taken")
  end

  scenario 'user signs up with non-matching passwords' do
    expect { sign_up confirm_password: "wrong" }.to change(User, :count).by 0
    expect(page).to have_content("not match")
  end

end

feature 'signing in' do

  before(:each) do
    sign_up
    sign_out
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content("Hello")
    sign_in
    expect(page).to have_content("Hello")
  end

  scenario 'with incorrect credentials' do
    sign_in username: "jbloggs", password: "wrong"
    expect(page).to have_content("incorrect")
  end

end