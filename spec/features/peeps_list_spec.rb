require 'spec_helper'

feature "Viewing messages" do
  before(:each) do
    user = User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')

    user.peeps.create(message: 'Hello',
    name: 'name',
    username: 'user')

    sign_in('test@test.com', 'password')
  end
  
  scenario "displays a list of existing links" do
    visit ('/peeps')
    expect(page.status_code).to eq(200)

    within 'ul#peeps' do
      expect(page).to have_content("Hello")
      #update to include name and user handle
    end
  end
end
