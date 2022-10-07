require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/app.rb'
require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/spec/spec_helper.rb'
#No RSpec.describe needed for feature tests

feature 'Viewing peeps' do
  feature 'Visiting homepage' do
    scenario 'Page title is visible' do
      visit '/'
      expect(page).to have_content 'Chitter Manager'
    end
  end
end

