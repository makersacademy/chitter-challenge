feature 'index page' do
  scenario 'displays the title Chitter on the page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
