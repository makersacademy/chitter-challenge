require_relative '../../app.rb'
require 'pg'
require 'peep'

feature 'Peep Homepage' do
  scenario 'Can see peeps' do
    p  peep_1 = Peep.create(:content => "Hello World", :username => "First the worst", :created_at => Time.now)
    p  Peep.create(:content => "Second Peep", :username => "Second the best", :created_at => Time.now)
    p  Peep.create(:content => "Peep Peep", :username => "Peeping Tom", :created_at => Time.now)
    p  peep_1.content

    visit '/peeps'

    expect(page).to have_content("Hello World")
    expect(page).to have_content("Second the best")
    expect(page).to have_content("Peep Peep")

  end
end
