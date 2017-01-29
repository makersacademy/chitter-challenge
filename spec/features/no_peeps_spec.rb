require 'spec_helper'

feature 'no existing peeps' do
  before(:each) do
    user = User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')
  end

  scenario "no existing peeps" do
    sign_in('test@test.com', 'password')
    visit ('/peeps')
    expect(page).to have_content('No Peeps yet :(')
  end

  scenario "no existing peeps" do
    visit ('/')
    expect(page).to have_content('No Peeps yet :(')
  end
end
