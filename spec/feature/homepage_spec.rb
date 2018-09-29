feature 'homepage' do
  scenario 'displays title' do
    visit '/'
    expect(page).to have_content 'Chitter!'
  end
end
