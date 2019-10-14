feature 'Home page lists peeps' do
  scenario 'user can see Peeps from TEST database' do
    visit('/')
    expect(page).to have_content('This is a Peep from the TEST DB!')
  end
end
    feature 'User can submit a Peep' do

      scenario 'Page shows a blank text field' do
        visit('/')
        expect(page).to have_field('peep')
      end

      scenario 'A user can click the Peep it! button' do
        visit('/')
        expect(page).to have_button 'Peep it!'
      end

      scenario 'A user can enter content, click submit and see Peep' do
        visit('/')
        fill_in 'peep', with: 'I love peeping!'
        click_button'Peep it!'
        expect(page).to have_content'I love peeping!'
      end




    end
