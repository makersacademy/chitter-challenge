require './app.rb'

feature 'display' do
  scenario 'can display the main Chitter board' do
    visit '/'
    expect(page).to have_css('h1', text: "Peep Board")
  end

  scenario 'can display a peep on the board' do
    visit '/'
    expect(page).to have_content("Name: Content")
  end
end
