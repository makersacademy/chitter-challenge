feature 'posting a peep' do
  scenario 'the user posts a new peep' do
    visit '/'
    peep_text = "This is a new peep #{rand(1.1000)}"
    fill_in :peep_text, with: peep_text
    click_on 'Post'
    expect(page).to have_content peep_text
  end
end
