feature 'visit peeps' do
  scenario 'clicking view peeps takes you to the peep page' do
    visit('/')
    click_button('View Peeps')
    expect(page).to have_content('PEEPS')
  end
end
