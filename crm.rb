require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end
	
	def print_menu
		# system "clear"
		puts "Welcome to #{@name}. Please choose one of the following numbers"
		puts
		puts "(1) Add a contact"
		puts "(2) Modify a contact"
		puts "(3) Display all contacts"
		puts "(4) Display a contact"
		puts "(5) Display an attribute"
		puts "(6) Delete a contact"
		puts "(7) Exit"
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
		 	# system "clear"
		 	add_contact
		when 2
			# system "clear"
			modify_contact
		when 3
		 	display_all_contacts
		else 
			puts "Wrong choice"
			return
		end
	end

	def add_contact
		puts "Please enter First name:"
		first_name = gets.chomp
		puts "Please enter Last name:"
		last_name = gets.chomp
		puts "Please enter Email:"
		email = gets.chomp
		puts "Please enter Note:"
		note = gets.chomp

		# system "clear"

		puts "You have successfuly added #{first_name} #{last_name}"

		sleep(2)
		
		# system "clear"

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
			# when 2 then puts @rolodex.modify_contact(last_name)
			# when 3 then puts @rolodex.modify_contact(email_name)
			# when 4 then puts @rolodex.modify_contact(note_name)
		end
	end

	def modify_first_name
		puts "Enter the index"
		contact_id = gets.chomp.to_i
		contact = @rolodex.find_user_by_id(contact_id)
		puts "Your name is #{contact.first_name}"
		puts "Enter new name"
		new_name = gets.chomp
		contact.first_name = new_name
		puts"This is your new name #{contact.first_name}"
	end

	def display_all_contacts
		# system ("clear")
		@rolodex.contacts.each do |contact|
			puts "First name:#{contact.first_name}       Last name:#{contact.last_name}        Email: <#{contact.email}>"
			puts
		end

		puts "Click any key to continue"

		pause = ""
		pause = gets.chomp
		if pause != ""
		end

		# system "clear"

	end
end

crm = CRM.new("Kiko Crm")

crm.main_menu 



