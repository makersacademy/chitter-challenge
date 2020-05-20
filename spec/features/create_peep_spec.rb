feature 'create peep' do
  scenario 'on create peep page, user can create peep' do
    visit('/peeps/new')
    expect(page).to have_content "Start peeping!"
    fill_in(:new_peep, with: "This is my first peep!")
    click_on('Submit')
    expect(page).to have_content "Catch up on the latest peeps!"
  end
end
