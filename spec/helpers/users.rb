module UsersHelpers
  def post_peep
    visit '/peeps/new'
    fill_in "peep", with: "test"
    click_button "peep"
  end
end
