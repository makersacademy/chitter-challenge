require 'spec_helper'

feature "User sees the list of peeps" do

  before(:each) do
    Peep.create(content: 'Peep Peep', creation_date: Time.now)
  end

  test = Peep.create(content: 'Peep', creation_date: Time.now)

  scenario "When visiting the home page" do
    visit('/')
    expect(page).to have_content('Peep Peep')
  end




end
