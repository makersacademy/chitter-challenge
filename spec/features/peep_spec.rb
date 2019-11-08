feature 'create a peep' do
  scenario 'a user can type out a peep' do
    visit '/peep'
    fill_in 'peep', :with => "A load of nonsense.."
    click_button 'Post'
    expect(page).to have_content "A load of nonsense.."
  end
end
