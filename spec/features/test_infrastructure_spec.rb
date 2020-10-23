feature 'Testing infrastructure' do
  scenario 'Test the infrastructure is working' do
    visit '/test'
    expect(page).to have_content "Testing, 1, 2, 3..."
  end
end
