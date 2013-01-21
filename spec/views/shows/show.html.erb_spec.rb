require 'spec_helper'

describe "shows/show" do
  before(:each) do
    @show = assign(:show, stub_model(Show,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/Town/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Venue/)
    rendered.should match(/Venue Url/)
    rendered.should match(/Event/)
    rendered.should match(/Ticket/)
    rendered.should match(/Ticket Url/)
    rendered.should match(/Cobill1/)
    rendered.should match(/Cobill2/)
    rendered.should match(/Cobill3/)
    rendered.should match(/Permalink/)
  end
end
