# feature 'Front page test' do
#   scenario 'expect front page to have hello world on it' do
#     visit ('/')
#     expect(page).to have_content 'Hello World'
#   end
# end

feature 'Enter a Peep' do
  scenario 'allow a user to enter a peep' do 
    visit('/peep')
    expect(page).to have_content 'Enter peep here'
    expect(page).to have_selector(:link_or_button, "Enter Peep")
    click_button 
  end 
end