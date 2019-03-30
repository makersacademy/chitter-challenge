# Testing the viewing of pees when user hits '/' route

feature 'Viewing peeps' do
  scenario 'when visiting the index page' do
    visit '/'
    expect(page).to have_content 'Chitter app - Peeps'
  end

  scenario 'user sees name, handle, peep, timestamp ot peeps when visiting the peeps page' do
    visit '/peeps'
    
    expect(page).to have_content 'Chitter app - Peeps'
    expect(page).to have_content 'Cosmin'
    expect(page).to have_content 'John'
    expect(page).to have_content 'Mike'
    expect(page).to have_content '@micosmin'
    expect(page).to have_content '@mike'
    expect(page).to have_content '@john'
    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Hello world - This is John'
    expect(page).to have_content 'Hello world - This is Mike'
    expect(page).to have_content '10m'
  end
end