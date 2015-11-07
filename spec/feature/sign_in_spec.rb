require 'web_helper'

feature 'sign in' do
  scenario 'new user signs in' do
    join
    expect(page.status_code).to eq(200)
    expect{ join }.to change(User, :count).by(1)
    expect(User.first.username).to eq("Gio")
  end
end
