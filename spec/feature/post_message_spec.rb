feature "post message" do
  scenario "it posts a message and displays it on a webpage" do
    visit '/peep/new'
    fill_in 'peep', :with => 'I am a test peep'
    expect(page).to have_content('I am a test peep')
  end
end