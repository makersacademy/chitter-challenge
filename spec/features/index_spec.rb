require './spec/web_helpers'

feature 'homepage' do
  scenario 'add peep' do
    visit('/')
    fill_in 'text', with: 'Otters are cute'
    click_button 'Peep'
    expect(page).to have_content 'Otters are cute'
  end

  scenario 'views all latest peeps' do
    visit_homepage_fill_in_peeps
    expect(page).to have_content 'Otters are cute'
    expect(page).to have_content 'But Squirrels are better'
    expect(page).to have_content 'Yo wadddup'
  end

  scenario 'see the time a peep was created' do
    visit_homepage_fill_in_peeps
    expect(page).to have_content Time.now.strftime("%d %b %H:%M:%S").to_s
  end
end