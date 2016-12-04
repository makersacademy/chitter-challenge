require 'spec_helper.rb'

feature 'viewing peeps' do

  scenario 'user can see existing peeps' do
    Peep.create(message: 'I have just joined Chitter!')
    visit '/chitter'

    within 'ul#peeps' do
      expect(page).to have_content('I have just joined Chitter!')
    end
  end

end
