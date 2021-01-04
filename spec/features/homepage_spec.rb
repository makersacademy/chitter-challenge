feature 'homepage' do
  scenario 'has a text box' do
    visit('/')
    expect(page).to have_field 'peep'
  end

  scenario 'has a submit button' do
    visit('/')
    expect(page).to have_button 'Peep'
  end
end
  