feature 'testing infrastructure' do
  scenario 'app runs as expected' do
    visit('/')
    expect(page).to have_content 'Working!'
  end
end
