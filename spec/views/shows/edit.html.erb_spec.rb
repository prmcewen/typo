require 'spec_helper'

describe "shows/edit" do
  before(:each) do
    @show = assign(:show, stub_model(Show,
      :address => "MyString",
      :town => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :venue => "MyString",
      :venue_url => "MyString",
      :event => "MyString",
      :ticket => "MyString",
      :ticket_url => "MyString",
      :cobill1 => "MyString",
      :cobill2 => "MyString",
      :cobill3 => "MyString",
      :permalink => "MyString"
    ))
  end

  it "renders the edit show form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shows_path(@show), :method => "post" do
      assert_select "input#show_address", :name => "show[address]"
      assert_select "input#show_town", :name => "show[town]"
      assert_select "input#show_state", :name => "show[state]"
      assert_select "input#show_zip", :name => "show[zip]"
      assert_select "input#show_venue", :name => "show[venue]"
      assert_select "input#show_venue_url", :name => "show[venue_url]"
      assert_select "input#show_event", :name => "show[event]"
      assert_select "input#show_ticket", :name => "show[ticket]"
      assert_select "input#show_ticket_url", :name => "show[ticket_url]"
      assert_select "input#show_cobill1", :name => "show[cobill1]"
      assert_select "input#show_cobill2", :name => "show[cobill2]"
      assert_select "input#show_cobill3", :name => "show[cobill3]"
      assert_select "input#show_permalink", :name => "show[permalink]"
    end
  end
end
