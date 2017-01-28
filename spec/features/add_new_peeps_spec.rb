feature "FEATURE: post new peep" do

  scenario "can access post a peep page" do
    sign_up
    click_button('add_new_peep')
    within 'form#new_peep_form' do
      expect(page).to have_selector('button#post_peep')
    end
  end

 scenario "can add new peep" do
   sign_up
   post_a_peep(content: "My first peep!")

   expect(Peep.all.count).to eq 1
   
     within 'ul#peeps' do
       expect(page).to have_content('My first peep!')
     end
   end

  #  scenario "can't post peep without content" do
  #    sign_up
  #      click_button('add_new_peep')
  #      click_button('post_peep')
  #      save_and_open_page
  #      expect(page).to have_content 'Please write your peep first!'
  #    end

end
