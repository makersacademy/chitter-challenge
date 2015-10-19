feature 'Creating peeps' do 

  # scenario 'I can click a button on the home page to take me to the new peep page' do 
  #   visit '/'
  #   user = create :user
  #   sign_in_as(user)
  #   click_button('New Peep')
  #   expect(current_path).to eq '/feed/new'
  # end

  scenario 'I can create a new peep' do 
    visit '/'
    user = create :user
    sign_in_as(user)
    fill_in 'message', with: 'hello'
    click_button 'Peep'
    expect(current_path).to eq '/feed'
    within 'ul#peeps' do 
      expect(page).to have_content('hello')
    end 
  end

  scenario 'Peeps are created with correct relative time stamp' do 
    visit '/'
    user = create :user
    sign_in_as(user)
    fill_in 'message', with: 'hello'
    click_button 'Peep'
    within 'ul#peeps' do 
      expect(page).to have_content('Just now')
    end
  end

  scenario 'I can only peep if I am logged in' do 
    visit '/feed'
    expect(page).not_to have_button('Peep')
  end



end