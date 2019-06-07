feature Chitter do 

  scenario 'it displays the peeps' do 
    visit '/peeps'
    expect(page).to have_content('Today is a great day! Ask me why...')
  end 

  scenario 'it displayes the name' do 
    visit '/peeps'
    expect(page).to have_content('Lauren')
  end 

end
