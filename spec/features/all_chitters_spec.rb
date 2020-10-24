feature 'route shows all peeps in reverse chronological' do
  scenario 'when a user goes to /chitters/all they see all peeps ever submitted' do 
    visit('/chitters/all')
    expect(page).to have_content("this is the first message ever posted to chitter, this is the second, okay now i've posted three")
  end
end