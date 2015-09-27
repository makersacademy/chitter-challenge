require './spec/factories/peep'

feature 'creating peep' do
  scenario 'can create a new peep' do
    peep = build :peep
    visit '/peep/new'
    fill_in 'content', with: peep.content
    click_button 'Post'
    expect(current_path).to eq('/peep/all')
    expect(page).to have_content peep.content
  end
end
