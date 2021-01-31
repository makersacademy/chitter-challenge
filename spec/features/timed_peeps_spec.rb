feature 'Time and date of peeps' do
  scenario "user's peep displays time posted" do
    visit('/')
    time = Time.now
    fill_in :peep, with: 'Posted at;'
    click_button('Peep')
    expect(page).to have_content time.strftime("%k:%M %d/%m/%Y")
  end
end
