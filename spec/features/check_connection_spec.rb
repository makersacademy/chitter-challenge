feature 'check connection' do
  scenario 'viewing added bookmark' do
    visit '/'
    expect(page).to have_content('Hello')
  end
end
