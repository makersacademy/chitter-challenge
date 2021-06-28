feature 'Viewing homepage' do
  scenario 'visiting the chitter homepage' do
    visit ('/')
    expect(page).to have_content 'Chitter'
  end
end