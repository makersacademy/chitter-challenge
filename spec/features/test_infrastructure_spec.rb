feature 'Homepage' do
  scenario 'has a homepage' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "hello"
  end
end
