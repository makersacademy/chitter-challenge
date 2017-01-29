require 'spec_helper'

feature "Adding peeps" do
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
  scenario "adds a peep to chitter with a message, name and user handle" do
    visit ('/peeps')
    message = "Hello"
    fill_in 'message', with: message
    click_button 'Add'

    within 'ul#peeps' do
      expect(page).to have_content(message)
      expect(page).to have_content('user')
      expect(page).to have_content('name')
    end
  end
end
