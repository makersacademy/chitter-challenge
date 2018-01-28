feature 'peeps' do
  scenario 'displaying peeps' do
    visit '/'
    click_button 'peeps'
    expect(page).to have_content('Peeps')
  end

  scenario 'adding peeps' do

  end
end
