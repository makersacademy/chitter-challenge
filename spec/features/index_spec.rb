feature 'Viewing Peeps' do
  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_title('Chitter')
  end

  scenario 'viewing peeps' do
    visit '/'
    click_button 'Go to peeps'
    expect(page).to have_title('Peeps')
  end
end
