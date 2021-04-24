require 'rails_helper'

RSpec.describe "peeps/edit", type: :view do
  before(:each) do
    @peep = assign(:peep, Peep.create!(
      content: "MyText",
      user_id: 1
    ))
  end

  it "renders the edit peep form" do
    render

    assert_select "form[action=?][method=?]", peep_path(@peep), "post" do

      assert_select "textarea[name=?]", "peep[content]"

      assert_select "input[name=?]", "peep[user_id]"
    end
  end
end
