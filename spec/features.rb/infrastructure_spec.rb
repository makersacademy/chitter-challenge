feature 'Homepage' do
  scenario 'has the title of the app clone Chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter:'
  end
end
