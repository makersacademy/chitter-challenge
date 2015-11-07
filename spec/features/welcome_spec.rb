feature 'welcome page' do
  scenario 'has a welcome page with login button' do
    visit '/'
    expect(page.status_code).to eq 200
  end
end
