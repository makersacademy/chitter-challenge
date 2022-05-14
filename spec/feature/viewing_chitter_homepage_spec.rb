feature 'Viewing Homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content "Chitter Home."
  end
end