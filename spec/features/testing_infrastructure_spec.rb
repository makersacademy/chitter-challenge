feature 'Checking test infrastructure' do
  scenario 'Homepage contains Hello World' do
    visit('/')
    expect(page).to have_content('Hello world!')
  end
end
