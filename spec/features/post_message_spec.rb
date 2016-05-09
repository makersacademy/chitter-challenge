feature 'Post Message' do

  scenario 'user can post a message once they have signed in' do
    sign_in_and_post
    expect(current_path).to eq '/posts/view'
    expect(page).to have_content 'Hello everyone, this is my first "Cheep"!'
  end

  scenario 'cheeps have users name and username associated with them' do
    sign_in_and_post
    expect(current_path).to eq '/posts/view'
    within('div#messages') do
      expect(page).to have_content "Posted by Megatron (best_bot"
    end
  end

  scenario 'cannot cheep if not signed in' do
    visit '/posts/view'
    expect(page).not_to have_button "Make a Cheep"
  end

end