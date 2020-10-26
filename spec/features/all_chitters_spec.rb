feature 'route shows all peeps in reverse chronological' do
  scenario 'when a user goes to /chitters/all they see all peeps ever submitted and the time it was submitted' do 
    visit('/')
    fill_in(:peep, with: "This is a test peep")
    create_time = "#{Time.new.hour}:#{Time.new.min}"
    click_button('Submit')
    visit('/chitters/all')
    expect(page).to have_content("This is a test peep")
    expect(page).to have_content(create_time)
  end
end
