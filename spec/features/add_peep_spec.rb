require_relative '../spec_helper.rb'

feature 'adding peeps' do
let!(:peep) { Peep.create(message: 'test message') }

  scenario 'shows a peep on a page' do
    visit '/chitter'
    expect(page).to have_content(peep.message)

  end
end