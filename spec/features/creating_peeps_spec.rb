feature 'posting peeps to chitter' do
  scenario 'creating peeps' do
    sign_up
    write_a_peep
    expect(page).to have_content 'Lorem ipsum'
  end

  scenario "Peep is posted with the date, time and user" do
    sign_up
    write_a_peep
    expect(page).to have_content ("Lorem ipsum")
    expect(page).to have_content (Time.now.strftime("%d/%m/%Y at %I:%M%p"))
  end
end
