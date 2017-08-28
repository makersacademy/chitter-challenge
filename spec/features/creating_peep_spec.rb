feature 'Make peeps (messages)' do

  scenario 'user can post messages' do
    Peep.create(message: 'My First Peep')
    Peep.create(message: 'My Second Peep')
    visit('/peeps')

    within "ul#peeps" do
      expect(page).to have_content 'My First Peep'
    end
  end

  scenario 'I can see the textbox' do
    visit '/peeps/new'
    expect(page).to have_field("msg")
  end

  scenario 'I can see my peeps' do
    sign_up
    visit '/peeps/new'
    fill_in("msg", with: "Hello World")
    click_button("Post")
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
    	 expect(page).to have_content("Hello World")
    end
  end

  # scenario 'You can only post a peep if logged in' do
  #   visit '/peeps/new'
  #   fill_in("msg", with: "Hello World")
  #   click_button("Post")
  #   expect(current_path).to eq '/users/new'
  #   end
end
