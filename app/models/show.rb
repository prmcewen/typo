class Show < ActiveRecord::Base

	belongs_to :text_filter					   
	attr_accessible :address, :cobill1, :cobill2, :cobill3, :endtime, :event, :start, :state, :ticket, :ticket_url, :town, :venue, :venue_url, :zip

end
