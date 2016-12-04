feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    sign_up
    visit '/'
    fill_in 'text',   with: 'Hello world'
    click_button 'Post a peep'
    expect(current_path).to eq '/'

    within 'ul#peeps' do
      expect(page).to have_content('Hello world')
    end
  end


  scenario 'a new peep displays name and user name' do
    sign_up
    visit '/'
    fill_in 'text',   with: 'Hello world'
    click_button 'Post a peep'


    within 'ul#peeps' do
      expect(page).to have_content('Agata')
      expect(page).to have_content('Agatina')
    end
  end


  scenario 'I can create multiple peeps' do
    sign_up
    visit '/'
    fill_in 'text',   with: 'Hello world'
    click_button 'Post a peep'
    fill_in 'text',   with: 'Hello world'
    click_button 'Post a peep'
    expect(current_path).to eq '/'

    within 'ul#peeps' do
      expect(page).to have_content('Hello world')
    end
  end
end
