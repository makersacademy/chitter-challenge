feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'A maker can see peeps' do
    visit('/peeps')
  
    expect(page).to have_content 'This is my first peep'
    expect(page).to have_content 'Why have you used my identity?'
  end
end
