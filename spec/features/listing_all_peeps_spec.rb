require 'spec_helper'

feature 'User browses the list of peeps' do

  before(:each) {
    Peep.create(text: 'my first peep',
                time: '01/01/2015 00:0')
  }

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content('my first peep')
  end
end
