require 'spec_helper'

feature 'View peeps' do
  before do
    Peep.create(content: 'My first peep!')
  end
  context 'when visiting the homepage' do
    # TODO: test reverse chronological order
    scenario 'user sees a list of peeps in reverse chronological order' do
      visit '/'
      expect(page).to have_content("Welcome to Chitter")
      within('section#peeps') do
        expect(page).to have_content(Peep.first.content)
      end
    end

    # scenario 'user sees the name and username handle of the peep\'s author' do
    #   visit '/'
    #
    #   within('section#peeps') do
    #     # expect(page).to have_content('Firstname Lastname', 'User')
    #   end
    # end
  end
end
