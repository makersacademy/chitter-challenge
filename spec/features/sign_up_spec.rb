require 'spec_helper'

feature 'signing up' do
  scenario 'user signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content'Welcome, jo@jo.com!'
    expect(User.first.username).to eq('jo@jo.com')

  end
end