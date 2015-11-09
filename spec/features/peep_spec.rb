require 'spec_helper.rb'

feature 'posting messages to Chitter' do

  let(:user) do
    User.create(name: 'Dave',
                username: 'Big Dave',
                email: 'dave@email.com',
                password: 'secret123')
  end

  scenario 'I can make a peep' do
    sign_in(email: user.email, password: user.password)
    fill_in :body, with: 'Hello'
    click_button 'Post peep'

    within 'ul#peeps' do
      expect(page).to have_content('Hello')
      expect(page).to have_content('Big Dave')
    end
  end
end
