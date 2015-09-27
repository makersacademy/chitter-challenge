feature 'Viewing peeps' do
  scenario 'Every people will contain the name of the person who posted it' do
    visit '/peeps/new'
    fill_in 'body', with: 'test peep'
    click_button 'Post Peep'

    expect(current_path).to eq '/peeps'


        expect(page).to have_content('Anthony')
    end
end