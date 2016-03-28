require 'orderly'

feature 'creating a new peep: ' do

  before :each do
    visit '/'
    User.create(username: "test_user" , pass: "test_pwd", email: "nil")
    fill_in "username" , with: "test_user"
    fill_in "password" , with: "test_pwd"
    click_button "login"
  end

  feature 'new peep form' do

    scenario 'has a field for the message' do
      expect(page).to have_field "peep_text"
    end

    scenario 'has a field for the tags' do
      expect(page).to have_field "tags"
    end

    scenario 'has a button to send the peep' do
      expect(page).to have_button "peep"
    end

  end

  feature 'sending peeps' do

    before :each do
      fill_in "peep_text" , with: "peep_1"
      fill_in "tags" , with: "tag1,tag2"
      click_button "peep"
      fill_in "peep_text" , with: "peep_2"
      fill_in "tags" , with: "tag3"
      click_button "peep"
    end

    scenario 'sent peep appears in the list' do
      expect(page).to have_content "peep_1"
    end

    scenario 'sent peeps appears in reverse chronological order' do
      expect("peep_2").to appear_before "peep_1"
    end

    scenario 'peeps longer than the limit gets rejected' do
      fill_in "peep_text" , with: "longpeep" + "g" * 193
      fill_in "tags" , with: "notag"
      click_button "peep"
      expect(page).not_to have_content "long"
    end

    scenario 'sent tag appears alongside the peeps' do
      expect(page).to have_content "peep_1 #tag1"
    end

    scenario 'sent tags gets parsed and divided' do
      expect(page).to have_content "#tag1 #tag2"
    end

  end

end
