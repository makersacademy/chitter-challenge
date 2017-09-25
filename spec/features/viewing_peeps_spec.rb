require 'web_helper'

feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    create_peep

    within 'ul#peeps' do
      expect(page).to have_content('Random title')
    end
  end
end
