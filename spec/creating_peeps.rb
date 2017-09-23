feature 'creating peep' do
  scenario 'I will be able to create a peep' do
    visit('/peep/new')
    fill_in :title, with: "title"
    fill_in :text, with: "this is some text"
    click_button 'submit'
  end
end
