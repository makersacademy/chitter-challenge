feature 'Viewing peeps' do
  scenario '-visiting the homepage' do
    visit('/chitter')
    expect(page).to have_content 'Chitter'
  end

  scenario '-viewing peeps' do
    visit('/chitter')
    expect(page).to have_content('This is the first peep ever on Chitter!')
  end
end
