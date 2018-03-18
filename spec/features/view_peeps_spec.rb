feature 'View peeps' do
  scenario 'A user can see peeps' do
    visit '/'
    expect(page).to have_content "What a beautiful morning!"
    expect(page).to have_content "Back on terra firma."
    expect(page).to have_content "Free as a bird."
  end
end
