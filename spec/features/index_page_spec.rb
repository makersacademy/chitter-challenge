feature 'First test' do
  scenario 'can get a 200' do
    visit '/'
    expect(page.status_code).to eq(200)
  end
end
