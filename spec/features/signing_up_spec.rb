require 'spec_helper'

feature "user signs up" do
  scenario "with valid email" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq "ina@test.com"
  end
end