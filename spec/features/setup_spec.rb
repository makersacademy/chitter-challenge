feature 'app.rb works' do
  scenario 'base page works' do
    visit '/'
    expect(page).to have_content('text')
  end
end
