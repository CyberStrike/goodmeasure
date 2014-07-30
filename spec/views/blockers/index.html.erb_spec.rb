require 'rails_helper'

RSpec.describe "blockers/index", :type => :view do
  before(:each) do
    assign(:blockers, [
      Blocker.create!(
        :blocker => "Blocker",
        :cohort => nil
      ),
      Blocker.create!(
        :blocker => "Blocker",
        :cohort => nil
      )
    ])
  end

  it "renders a list of blockers" do
    render
    assert_select "tr>td", :text => "Blocker".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
