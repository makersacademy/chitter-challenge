feature 'Adding a new peep' do
  let(:time) { "12:12:12" }
  scenario 'A user can add a peep to Peep Manager' do
    visit('/peeps/new')
    fill_in('message', with: 'Test Peep')
    Capybara.ignore_hidden_elements = false
    find(:xpath, '//input[@name="time_stamp"]').set time
    # first('input#name', visible: false).set(time)
    click_button('Submit')

    expect(page).to have_content("Test Peep. Posted at:#{time}")
  end
end
