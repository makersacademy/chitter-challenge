require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/app.rb'


feature 'Viewing homepage' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit ('/')
      expect(page).to have_content 'Chitter'
    end
  end
end
