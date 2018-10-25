feature "adding peeps" do
  before do
    visit '/'
    click_button 'New Peep'
  end

  scenario "user can view a form for adding peeps" do
    expect(page).to have_field("content")
  end
end
