feature "deleting peeps" do
  before do
    visit '/'
    sign_up_1
    create_peeps
  end

  scenario 'should see delete button' do
    expect(page).to have_selector(:button, "Delete_#{@peep_one.id}")
  end

  scenario "should not see delete button for others' peeps" do
    click_button "Sign Out"
    sign_up_2
    expect(page).not_to have_selector(:button, "Delete_#{@peep_one.id}")
  end

  scenario 'clicking button should remove peep from list' do
    click_button "Delete_#{@peep_one.id}"
    expect(page).to have_content "content2"
    expect(page).not_to have_content "content1"
  end
end
