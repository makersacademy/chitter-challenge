feature 'Creating new BLABBER posts' do

  scenario 'I can make new BLABBER posts on page' do

    visit('/posts/new')
    fill_in 'blab', with: 'Hi, this is thomas!'
    click_button 'blab'

    expect(current_path).to eq '/posts'

    within 'ul#posts' do
      expect(page).to have_content('Hi, this is thomas!')
    end
  end
end
