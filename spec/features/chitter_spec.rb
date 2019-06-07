require './app.rb'

feature 'display' do
  scenario 'can display the main Chitter board' do
    visit '/'
    expect(page).to have_css('h2', text: "Peep Board")
  end

  scenario 'can display a peep on the board' do
    visit '/'
    expect(page).to have_content("Name: Content")
  end

  scenario 'can view the create peep page' do
    visit '/'
    click_link 'Add'
    expect(page).to have_css('h2', text: "Add Peep")
  end

  scenario 'can display a recently added peep' do
    visit '/'
    click_link 'Add'
    fill_in 'name', with: "Test Name"
    fill_in 'content', with: "This is some content for a peep. This is a test."
    click_button 'Post'
    expect(page).to have_content("Test Name: This is some content for a peep. This is a test.")
  end
end
