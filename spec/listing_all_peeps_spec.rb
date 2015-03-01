require 'spec_helper'

feature 'User browses the list of peeps' do

  before(:each) {
    Peep.create(:message => 'Hi',)}

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Hi')
  end
end