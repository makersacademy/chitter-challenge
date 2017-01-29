require 'spec_helper'

feature "Viewing peeps" do
  before(:each) do
    user = User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')

    user.peeps.create(message: 'Hello',
    name: 'name',
    username: 'user')

    user.peeps.create(message: 'Hello2',
    name: 'name',
    username: 'user')
  end

  context "signed in" do
    scenario "displays a list of existing peeps" do
      sign_in('test@test.com', 'password')
      visit ('/peeps')
      expect(page.status_code).to eq(200)

      within 'ul#peeps' do
        expect(page).to have_content("Hello")
        expect(page).to have_content("name")
        expect(page).to have_content("@user")
      end
    end
    scenario "displays existing peeps in reverse chronological order" do
      sign_in('test@test.com', 'password')
      visit ('/peeps')

      within 'ul#peeps' do
        expect("Hello").to appear_before("Hello2")
      end
    end
  end

  context "not signed in" do
    scenario "displays a list of existing peeps" do
      visit ('/')
      within 'ul#peeps' do
        expect(page).to have_content("Hello")
        expect(page).to have_content("name")
        expect(page).to have_content("@user")
      end
    end
    scenario "displays existing peeps in reverse chronological order" do
      visit ('/')

      within 'ul#peeps' do
        expect("Hello").to appear_before("Hello2")
      end
    end
  end
end
