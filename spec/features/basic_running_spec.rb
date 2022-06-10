# ./spec/landing_page_spec.rb

feature 'Landing page' do
  scenario 'Opens / successfully' do
    visit('/')
    expect(page).to have_content 'Hello World!'
    expect(page).to have_content "Chitter!"
  end
end
