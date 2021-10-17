feature 'viewing peeps' do 
  scenario 'see list of peeps' do 
    visit('/peeps')
    expect(page).to have_content 'I am a great Peep'
    expect(page).to have_content 'I am another Peep'
  end 
end 

