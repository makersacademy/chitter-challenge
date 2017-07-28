feature 'Setup' do
  scenario 'can load css' do
    visit('/stylesheets/style.css')
    expect(page).to have_content('body')
  end

  scenario 'can get a 200 response' do
    visit '/'
    expect(page.status_code).to eq(200)
  end
end
