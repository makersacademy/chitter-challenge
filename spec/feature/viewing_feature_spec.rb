require './app'

RSpec.describe Chitter do
  feature 'Viewing Homepage' do
    scenario 'confirms homepage is working' do
      visit('/')
      expect(page).to have_content('Welcome To Chitter')
    end
  end
end
