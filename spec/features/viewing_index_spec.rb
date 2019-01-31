feature 'Viewing index page' do
  scenario 'visiting index page' do
    visit('/')
    expect(page).to have_content "Chitter away"
  end
end
