require 'spec_helper'

describe "shows/index" do
  before(:each) do
    assign(:shows, [
      stub_model(Show,
        :address => "Address",
        :town => "Town",
        :state => "State",
        :zip => "Zip",
        :venue => "Venue",
        :venue_url => "Venue Url",
        :event => "Event",
        :ticket => "Ticket",
        :ticket_url => "Ticket Url",
        :cobill1 => "Cobill1",
        :cobill2 => "Cobill2",
        :cobill3 => "Cobill3",
        :permalink => "Permalink"
      ),
      stub_model(Show,
        :address => "Address",
        :town => "Town",
        :state => "State",
        :zip => "Zip",
        :venue => "Venue",
        :venue_url => "Venue Url",
        :event => "Event",
        :ticket => "Ticket",
        :ticket_url => "Ticket Url",
        :cobill1 => "Cobill1",
        :cobill2 => "Cobill2",
        :cobill3 => "Cobill3",
        :permalink => "Permalink"
      )
    ])
  end

  it "renders a list of shows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Town".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "Venue Url".to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket Url".to_s, :count => 2
    assert_select "tr>td", :text => "Cobill1".to_s, :count => 2
    assert_select "tr>td", :text => "Cobill2".to_s, :count => 2
    assert_select "tr>td", :text => "Cobill3".to_s, :count => 2
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
  end
end
