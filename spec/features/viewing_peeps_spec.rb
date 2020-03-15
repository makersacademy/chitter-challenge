feature 'Viewing peeps' do
  scenario 'Users can see my peeps' do
    visit('/peeps')

    expect(page).to have_content "Hey there! This is a peep!"
    expect(page).to have_content "Urgh! The weather today is horrible."
    expect(page).to have_content "Coronavirus is really killing the mood here"
  end
end