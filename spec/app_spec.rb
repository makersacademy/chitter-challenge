require './app'

describe Chitter do
  feature 'Infrastructure test' do
    scenario 'Infrastructure test' do
      visit('/')
      expect(page).to have_content('Testing infrastructure')
    end
  end
end
