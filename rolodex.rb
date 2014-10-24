class Rolodex
	attr_reader :contacts
	
	@@index = 0
	
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact_id = @@index
		@@index += 1
		@contacts << contact
	end
end