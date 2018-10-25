feature "adding peeps" do
  before do
    visit '/'
    click_button 'New Peep'
  end

  scenario "user can view a form for adding peeps" do
    expect(page).to have_field("content")
  end

  scenario "user can add a peep and see it on the peeps page" do
    fill_in("content", with: "FAKE NEWS!")
    click_button 'Submit'
    expect(page).to have_content 'FAKE NEWS!'
  end
end
