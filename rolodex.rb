class Rolodex
	attr_reader :contacts
	
	@@index = 1
	
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def modify_contacts(contact)
	end

	def find_user_by_first_name(first_name)
		@contacts.each do |contact|
			if contact.first_name.include?(first_name)
				return contact
			end
		end
	end

	def find_user_by_id(id)
		@contacts.each do |contact|
			if contact.id == id
				return contact
			end
		end

	end
end