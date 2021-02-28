
feature 'view peeps' do
  scenario 'user wants to see peeps' do
    visit '/peeps'
    expect(page).to have_content "Hi Chitter!"
  end
end
