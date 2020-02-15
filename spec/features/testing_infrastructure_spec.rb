feature 'testing infrastructure' do
  scenario 'can run app and see homepage' do
    visit('/')
    expect(page).to have_content("Chitter")
  end
end
