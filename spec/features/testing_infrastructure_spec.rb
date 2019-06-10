feature 'infrastructure test' do
  scenario 'Has welcome homepage' do
    visit('/peeps')
    expect(page).to have_content 'Chitty chitty bang bang 🐭'
  end
end
