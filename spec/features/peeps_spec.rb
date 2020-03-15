require_relative '../helpers'
require 'message'

feature 'peeps' do

  scenario 'should list all peeps' do
    register
    create_peep
    expect(page).to have_content("this is a test peep")
  end

  scenario 'should list all peeps in reverse chronological order' do
    register
    create_peep
    visit('/new')
    fill_in('content', with: "another test peep")
    click_button("Submit")
    expect(first('.peep')).to have_content "another test peep"
  end

  scenario 'should create peep' do
    register
    create_peep
    expect(page).to have_content("this is a test peep")
  end

end
