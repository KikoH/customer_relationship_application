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

	def delete_contact(contact)
		contact = find_user_by_id(contact)
		if contact == false
			return false
		else
			@contacts.delete_if{|x| x.id == contact.id}
			return true
		end
	end

	def find_user_by_first_name(first_name)
		results = []

		@contacts.each do |contact|
			if contact.first_name == first_name
				results << contact
			end
		end
		return results
	end

	def find_user_by_last_name(last_name)
		@contacts.each do |contact|
			if contact.last_name.include?(last_name)
				return contact
			else
				return false
			end
		end
	end

	def find_user_by_note(note)
		@contacts.each do |contact|
			if contact.note.include?(note)
				return contact
			else
				return false
			end
		end
	end

	def find_user_by_email(email)
		@contacts.each do |contact|
			if contact.email.include?(email)
				return contact
			else 
				return false
			end
		end
	end

	def find_user_by_id(id)
		@contacts.each do |contact|
			if contact.id == id
				return contact
			else
				return false
			end
		end

	end
end