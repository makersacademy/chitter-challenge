feature 'Homepage loads successfully' do
  scenario 'infrastructure working correctly' do
    visit '/'
    expect(page.status_code).to eq 200
  end
end
