require 'rails_helper'

RSpec.describe "peeps/index", type: :view do
  before(:each) do
    assign(:peeps, [
      Peep.create!(
        content: "MyText",
        user_id: 2
      ),
      Peep.create!(
        content: "MyText",
        user_id: 2
      )
    ])
  end

  it "renders a list of peeps" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
