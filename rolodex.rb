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
		find_user_by_id(contact)
		@contacts.delete_if{|x| x.id == contact}
	end

	def find_user_by_first_name(first_name)
		@contacts.each do |contact|
			if contact.first_name.include?(first_name)
				return contact
			end
		end
	end

	def find_user_by_last_name(last_name)
		@contacts.each do |contact|
			if contact.last_name.include?(last_name)
				return contact
			end
		end
	end

	def find_user_by_note(note)
		@contacts.each do |contact|
			if contact.note.include?(note)
				return contact
			end
		end
	end

	def find_user_by_email(email)
		@contacts.each do |contact|
			if contact.email.include?(email)
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