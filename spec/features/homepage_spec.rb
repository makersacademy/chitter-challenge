feature 'Home Page' do
  scenario 'demonstrates correct infrastructure' do
    visit('/')
    expect(page).to have_content('Hello World!')
  end
end