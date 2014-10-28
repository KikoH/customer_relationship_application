require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end
	
	def print_menu
		system "clear"
		puts "Welcome to #{@name}. Please choose one of the following numbers"
		puts
		puts "(1) Add a contact"
		puts "(2) Modify a contact"
		puts "(3) Display all contacts"
		puts "(4) Display a contact"
		puts "(5) Display an attribute"
		puts "(6) Delete a contact"
		puts "(7) Exit"
		puts
		puts "Please choose a number"
	end

	def main_menu
		while true
			print_menu
			user_input = gets.to_i
			return if user_input == 7
			choice(user_input)
		end
	end

	def choice(input)
		case input
		when 1 
		 	system "clear"
		 	add_contact
		when 2
			system "clear"
			modify_contact
		when 3
			system "clear"
		 	display_all_contacts
		 	prompt
		 when 4
		 	system "clear"
		 	display_contact
		 when 5
		 	system "clear"
		 	display_attribute
		 when 6
		 	system "clear"
		 	delete_contact
		else 
			puts "Wrong choice"
			return
		end
	end

	def add_contact
		puts "Please enter First name:"
		first_name = gets.chomp.downcase
		puts "Please enter Last name:"
		last_name = gets.chomp.downcase
		puts "Please enter Email:"
		email = gets.chomp.downcase
		puts "Please enter Note:"
		note = gets.chomp.downcase

		system "clear"

		puts "You have successfuly added #{first_name} #{last_name}"

		sleep(2)
		
		system "clear"

		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def modify_contact
		puts "Please enter an attribute to be modified"
		puts "(1) for First name"
		puts "(2) for Last name"
		puts "(3) for Email"
		puts "(4) for Note"
		modify_attr = gets.chomp.to_i
		case modify_attr
			when 1 then modify_first_name
			when 2 then modify_last_name
			when 3 then modify_email
			when 4 then modify_note
		end
	end

	def display_contact
		puts "Which attribute would you like to find"
		puts "(1) for First name"
		puts "(2) for Last name"
		search_attr = gets.chomp.to_i
		case search_attr
			when 1
				puts "Please enter the first name of who you want to search for"
				search_f = gets.chomp.to_s
				contact = @rolodex.find_user_by_first_name(search_f)
			#Checking if contact.id is defined. If it is then display the contact if not then puts no matches found.
			if defined? contact.id
				system "clear"
				puts "These were the matching finds"

				puts "(ID) #{contact.id}, First name: #{contact.first_name} Last name: #{contact.last_name} Email: #{contact.email}  Note: #{contact.note}"

				prompt
			else
				puts "No matches found"
				
				prompt
			end
			when 2
				puts "Please enter the last name of who you want to search for"
				search_f = gets.chomp.to_s
				contact = @rolodex.find_user_by_last_name(search_f)
			if defined? contact.id
				system "clear"
				puts "These were the matching finds"
				puts "(ID) #{contact.id}, First name: #{contact.first_name} Last name: #{contact.last_name} Email: #{contact.email}  Note: #{contact.note}"
			else
				puts "No matches found"
				sleep(2)
			end
		end
	end

	def display_attribute
		puts "Please select one of the following attributes to display"

		puts "(1) for First name"
		puts "(2) for Last name"
		puts "(3) for Email"
		puts "(4) for Note"

		user_input = gets.chomp.to_i
		case user_input
		when 1
				puts "Please enter First name to look for"
				first_name = gets.chomp.downcase
				contact = @rolodex.find_user_by_first_name(first_name)
			if contact != false
				puts "Here are the matching results"
				puts "#{contact.first_name}"
				puts
				prompt
			else
				puts "No matches found"
				puts
				prompt
			end
		when 2
			puts "Please enter First name to look for"
				last_name = gets.chomp.downcase
				contact = @rolodex.find_user_by_last_name(last_name)
			if contact != false
				puts "Here are the matching results"
				puts "#{contact.last_name}"
				puts
				prompt
			else
				puts "No matches found"
				puts
				prompt
			end
		when 3
			puts "Please enter Email to look for"
				email = gets.chomp.downcase
				contact = @rolodex.find_user_by_email(email)
			if contact != false
				puts "Here are the matching results"
				puts "#{contact.email}"
				puts
				prompt
			else
				puts "No matches found"
				puts
				prompt
			end
		when 4
			puts "Please enter note to look for"
				note = gets.chomp.downcase
				contact = @rolodex.find_user_by_note(note)
			if contact != false
				puts "Here are the matching results"
				puts "#{contact.note}"
				puts
				prompt
			else
				puts "No matches found"
				puts
				prompt
			end
		end
	end

	def modify_first_name
		#Getting first name to modify from user
		puts "Please enter First name to be edited"
		contact_first_name = gets.chomp
		#Setting contact variable to rolodex find_user_by_id and passing in contact_id
		contact = @rolodex.find_user_by_first_name(contact_first_name)
		puts "Contact found matching first name #{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
		puts "Enter new name"
		#Taking in first name change
		new_name = gets.chomp
		
		#Asking the user whether they want to save changes
		puts "Are you sure you want to save the changes. type y or n"
		#Prompt variable to take user input
		user_prompt = gets.chomp.downcase
		# Prompting the user if they are sure about modifying their name
		if user_prompt == "y"
			contact.first_name = new_name
			puts"Contact edited"

			puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
			
			prompt
		elsif user_prompt == "n"
			return
		else
			puts "That was not a valid choice"

			prompt
		end
	end

	def modify_last_name
		puts "Please enter Last name to be edited"
		#Setting a variable to user input of index
		contact_last_name = gets.chomp
		#Setting contact variable to rolodex  and passing in contact_id
		contact = @rolodex.find_user_by_last_name(contact_last_name)
		puts "Contact found matching Last name #{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
		puts "Enter new last name"
		#Taking in first name change
		new_name = gets.chomp.to_s
		
		#Asking the user whether they want to save changes
		puts "Are you sure you want to save the changes. type y or n"
		#Prompt variable to take user input
		user_prompt = gets.chomp.downcase
		# Prompting the user if they are sure about modifying their name
		if user_prompt == "y"
			contact.last_name = new_name
			puts "Contact edited"

			puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"

			prompt
		elsif user_prompt == "n"
			return
		else
			puts "That was not a valid choice"
		end
	end

	def modify_email
		#Getting email to modify from user
		puts "Please enter Email to be edited"
		contact_email = gets.chomp
		#Setting contact variable to rolodex find_user_by_id and passing in contact_id
		contact = @rolodex.find_user_by_email(contact_email)
		puts "Email found #{contact.email}"
		puts "Enter new email"
		#Taking in first name change
		new_email = gets.chomp
		
		#Asking the user whether they want to save changes
		puts "Are you sure you want to save the changes. type y or n"
		#Prompt variable to take user input
		prompt = gets.chomp.downcase
		# Prompting the user if they are sure about modifying their name
		if prompt == "y"
			contact.email = new_email
			puts "Contact edited"
			puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
		elsif prompt == "n"
			return
		else
			puts "That was not a valid choice"
		end
	end

	def modify_note
		#Asking for note input from user
		puts "Please enter Note to be edited"
		contact_note = gets.chomp
		#Setting contact variable to rolodex find_user_by_id and passing in contact_id
		contact = @rolodex.find_user_by_note(contact_note)
		puts "Matching note #{contact.note}"
		puts "Enter new note"
		#Taking in first name change
		new_note = gets.chomp
		#Asking the user whether they want to save changes
		puts "Are you sure you want to save the changes. type y or n"
		#Prompt variable to take user input
		prompt = gets.chomp.downcase
		# Prompting the user if they are sure about modifying their name
		if prompt == "y"
			contact.note = new_note
			puts"Contact edited"
			puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email}"
		elsif prompt == "n"
			return
		else
			puts "That was not a valid choice"
		end
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "ID: (#{contact.id}), First name:#{contact.first_name}       Last name:#{contact.last_name}        Email: <#{contact.email}>"
			puts
		end

		#Prompt user to continue
		#prompt

	end

	def delete_contact
		display_all_contacts
		puts"Enter ID of user to delete"
		d_contact = gets.chomp.downcase.to_i
		#Contact_deleted waiting for a boolean value to check if contact was deleted
		contact_deleted = @rolodex.delete_contact(d_contact)
		system ("clear")
		
		#Checks if contact has been deleted or not
		if contact_deleted == true
			puts "Contact has been deleted"
		elsif contact_deleted == false
			puts "ID not found"
		end

		puts
		prompt
	end

	def prompt

		puts "Enter any key to continue"
		pause = ""
				pause = gets.chomp
				if pause != ""
				end
	end
end

crm = CRM.new("Bitmaker CRM")

crm.main_menu 



