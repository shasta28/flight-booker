class Flight < ActiveRecord::Base

	scope :by_date, -> { order(:departure) }
	scope :on_day, -> (day) { where("departure >= '#{day.to_time.beginning_of_day}' AND departure <= '#{day.to_time.end_of_day}'") }	

	belongs_to :to_airport, class_name: "Airport"
	belongs_to :from_airport, class_name: "Airport"

	has_many :bookings
	has_many :passengers, :through => :bookings

	def date_short
		departure.strftime("%Y-%m-%d")
	end

	def date_formatted_short
		departure.strftime("%m/%d/%Y")
	end

	def date_formatted_full
		departure.strftime("%b %d, %Y - %I:%M%p")
	end

end
