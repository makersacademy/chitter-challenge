require_relative '../../app.rb'
require 'pg'
require 'peep'

feature 'Peep Homepage' do
  scenario 'Can see peeps' do
    Peep.create(:content => "Hello World", :username => "First the worst", :created_at => "21:00")
    visit '/peeps'

    expect(page).to have_content("Hello World")
    expect(page).to have_content("First the worst")
  end

  scenario 'Peeps have a time' do
    Peep.create(:content => "Hello World", :username => "First the worst", :created_at => "21:00")
    visit '/peeps'

    expect(page).to have_content "21:00"
  end

end
