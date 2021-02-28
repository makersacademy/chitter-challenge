feature 'project infrastructure' do
  scenario 'test infrastructure is working' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
    # expect(page).to have_link "View peeps"
  end
end