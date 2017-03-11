require 'spec_helper'

feature 'As a user' do
  scenario 'I can create my own account' do
    expect { create_account }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome abc@gmail.com")
    expect(User.first.email).to eq("abc@gmail.com")
  end
end
