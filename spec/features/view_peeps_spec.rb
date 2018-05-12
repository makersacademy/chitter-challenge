require_relative '../../app.rb'
require 'spec_helper'
require 'pg'
# require 'peep'

feature 'Peep Homepage' do
  scenario 'Can see peeps' do
    p peep_1 = Peep.create(:content => "Hello World", :username => "First the worst")
    p peep_2 = Peep.create(:content => "Second Peep", :username => "Second the best")
    p peep_3 = Peep.create(:content => "Peep Peep", :username => "Peeping Tom")
    p peep_1.content

    visit '/peeps'

    expect(page).to have_content("Hello World")
    expect(page).to have_content("First the worst")
    expect(page).to have_content("Peep Peep")

  end
end
