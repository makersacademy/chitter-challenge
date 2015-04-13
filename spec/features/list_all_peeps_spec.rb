require 'spec_helper'

feature 'user can see the list of peeps' do

  before(:each) do
    Peep.create(content: 'Today is gonna be a big day')
  end

  scenario 'when visiting homepage' do
    visit '/'
    expect(page).to have_content('Today is gonna be a big day')
  end
end
