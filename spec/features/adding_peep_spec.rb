feature "add a peep" do
  it "adds a new peep" do
    visit('/peeps/new')
    fill_in('message', with: 'hello world')
    click_button 'Submit'

    expect(page).to have_content "hello world"
  end
end
