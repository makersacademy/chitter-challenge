require_relative '../factories/user'
require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    user = User.create(name: 'Test Test',
                username: 'testtest',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')

    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'

    visit '/peeps/new'
    fill_in :content, with: 'Testing, testing, one.. two.. peep'
    click_button 'Peep Content'

    within 'ul#peeps' do
      expect(page).to have_content('Testing, testing, one.. two.. peep')
    end
  end

end
