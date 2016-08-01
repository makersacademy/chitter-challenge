feature 'Creating a cheep' do
  scenario 'I can post a new cheep' do
    sign_up(user_name: 'samjbro')
    visit '/cheeps/new'
    fill_in 'content', with: "I just signed up for Chitter!"
    click_button 'Cheep it!'

    expect(current_path).to eq '/cheeps/index'
    within 'ul#cheeps' do
      expect(page).to have_content "I just signed up for Chitter!"
    end
  end
  scenario 'I can post a cheep as a user' do
    sign_up(user_name: 'samjbro')
    visit '/cheeps/new'
    fill_in 'content', with: "I just signed up for Chitter!"
    click_button 'Cheep it!'

    expect(page).to have_content"samjbro cheeped: I just signed up for Chitter!"
  end

end