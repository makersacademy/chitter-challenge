require 'peeps'

feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

  feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/chitter/peeps')

    expect(page).to have_content "my first peep"
    expect(page).to have_content "my second peep"

  end
end

  describe Peep do
  describe '.all' do
    it 'returns all bookmarks' do
      peep = Peep.all

      expect(peep).to include("my first peep")
      expect(peep).to include("my second peep")
    end
 end
end
