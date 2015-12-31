feature 'log out' do

  before do
    register
  end

  scenario 'receiving a goodbye message' do
    click_button('Log out')
    expect(page.status_code).to eq 200
    expect(page).to have_content "Goodbye!"
  end
end
