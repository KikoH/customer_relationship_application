require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end
	
	def print_menu
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
		system "clear"
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
		 	add_contact
		 	system "clear"
		when 2
			modify_contact
			system "clear"
		when 3
		 	display_all_contacts
		else 
			puts "Wrong choice"
			return
		end
	end

	def add_contact
		puts "First name"
		first_name = gets.chomp
		puts "Last name"
		last_name = gets.chomp
		puts "Email"
		email = gets.chomp
		puts "Note:"
		note = gets.chomp

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
			when 1 then puts "Modify first name here"
			when 2 then puts "Modify last name here"
			when 3 then puts "Modify email here"
			when 4 then puts "Modify note here"
		end
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name} #{contact.last_name} <#{contact.email}>"
		end
	end
end

crm = CRM.new("Kiko Crm")

crm.main_menu 



