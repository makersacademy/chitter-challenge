require 'pg'

feature 'Feature - Viewing Peeps' do
  scenario 'A user can see Peeps' do
    Peep.new_peep(message: "This is a peep")
    Peep.new_peep(message: "This is another peep")
    Peep.new_peep(message: "This is a third peep")

    visit('/')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "This is a third peep"
  end

  scenario 'Peeps have data/time stamp' do
    peep = Peep.new_peep(message: "This is a peep with time")
    visit('/')

    peep_time = find_by_id("#{peep.id}-peep-time")

    expect(peep_time).to have_text peep.formatted_peep_time

  end

end
