feature 'display peeps to visitors' do
  scenario 'guest visits the page' do
    visit '/'
    expect(page).to have_content 'You have power over your mind'
    expect(page.status_code).to eq 200
  end

end