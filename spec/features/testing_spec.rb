feature 'homepage' do
  scenario 'loads a morning message on homepage' do
    visit('/')
    expect(page).to have_content 'good morning'
  end
end
 