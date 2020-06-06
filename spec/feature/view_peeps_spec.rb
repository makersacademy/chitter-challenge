feature 'view peeps' do
  
  scenario "it should show a list of peeps" do
    visit('/peeps')

    expect(page).to have_content "this is a test peep"
  end
end