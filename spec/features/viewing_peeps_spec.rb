require 'pg'

feature 'Viewing peeps' do
  @fake_timestamp = "11pm"

  scenario 'a user can view all peeps' do # needs to be in reverse chronological order
    Peep.create(peep_body: 'Example peep posted at 3pm', created_at: @fake_timestamp)
    Peep.create(peep_body: 'Example peep posted at 2pm', created_at: @fake_timestamp)


    visit '/home'

    expect(page).to have_content "Example peep posted at 3pm"
    expect(page).to have_content "Example peep posted at 2pm"
  
  end 
end
