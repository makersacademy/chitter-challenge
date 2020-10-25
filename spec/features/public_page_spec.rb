feature 'Public Page' do 
  scenario 'title is shown' do 
    visit '/'
    expect(page).to have_content 'CHITTER'
  end

  # scenario 'peeps are shown' do
  #   visit '/'

  #   expect(page).to have_content 'This is my first peep! @USER_1'
  #   expect(page).to have_content 'This is my second peep! @USER_1'
  #   expect(page).to have_content 'This is my third peep! @USER_1'
  # end
end
