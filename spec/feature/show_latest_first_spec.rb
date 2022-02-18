feature 'display latest peep first' do
  scenario 'see the most recent peep at the top of the feed' do
    visit '/'
    fill_in("peep", with: 'Am I top?')
    click_button("Send Peep")
    expect(page).to have_selector("ol#@feed li:nth-child(1)", exact: 'Am I top?')
  end
end