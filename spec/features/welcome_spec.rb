feature 'welcome page' do
  scenario 'has a welcome page with login and signup buttons' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'CHITTER'
  end
end
