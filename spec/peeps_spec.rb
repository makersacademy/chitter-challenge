feature 'New peeps' do
  scenario 'user can post a message' do
    new_peep
    visit '/peeps'
    expect(page.status_code).to eq 200
    # expect(page).to have_content "Hello, welcome to my peep posts"
  end

end

feature 'View peeps' do
  scenario 'user can see all peeps' do
    new_peep
    new_peep
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Peeps"
  end
end
