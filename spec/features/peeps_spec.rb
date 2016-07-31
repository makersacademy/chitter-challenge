feature 'Creating and Viewing Peeps' do

    before(:each) do
      sign_up


      visit '/peeps/new'
      fill_in 'content', with: "First Peep"
      click_on 'Post'

      visit '/peeps/new'
      fill_in 'content', with: "Second Peep"
      click_on 'Post'

      visit '/'
    end


    scenario "user can create see peeps " do

      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"

    end

    # scenario "users can see when peeps were created" do
    #
    #   expect(page).to have_content('2016')
    # end

    # scenario 'peeps are in reverse chronological order' do
    #
    #
    # end

  end
