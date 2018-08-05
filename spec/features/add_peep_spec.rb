feature "Testing adding of peeps to database" do

  let(:time) { Time.now }
  before do
    allow(Peep).to receive(:Time).and_return(time)
  end

  scenario "Adding a new peep" do
    visit '/'
    fill_in "username", with: "Marek"
    click_button "Get Peepin'"
    fill_in "peep_text", with: "This is my first peep!"
    click_button "Send your peep"
    expect(page).to have_content "Marek"
    expect(page).to have_content "#{time.strftime('%H:%M:%S')}"
    expect(page).to have_content "Today"
    expect(page).to have_content "This is my first peep!"
  end
  scenario "Adding a new peep with an apostrophe in it" do
    visit '/'
    fill_in "username", with: "Marek"
    click_button "Get Peepin'"
    fill_in "peep_text", with: "Where we droppin' boys?"
    click_button "Send your peep"
    expect(page).to have_content "Marek"
    expect(page).to have_content "#{time.strftime('%H:%M:%S')}"
    expect(page).to have_content "Today"
    expect(page).to have_content "Where we droppin' boys?"
  end
end
