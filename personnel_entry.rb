class Employee

	attr_reader :name, :role, :location

	def initalize(name, role, location)
		@name = name
		@role = role
		@location = location
	end
end

@accounts = []

def main
	puts "Welcome to Apt-Two Employee login. Where our employees are taken care of."
	main_menu
end

def main_menu
	puts "Please choose from the following options:"
	puts "_________________________________________"
	puts "1. Create a new employee account"
	puts "2. View employee records."
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice
		when 1
			system "clear"
			create_account
		when 2
			system "clear"
			account_login
		when 3
			end_session
		else
			system "clear"
			puts "Not a valide selection. Try again."
			main_menu
	end
end

def create_account
	puts "Create new employee account"
	puts "--------------------------"
	puts "What's your full name: "
	name = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts "What's your role?"
	role = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts "What location?"
	location = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	#new_account = Account.new(name,role)
	#@accounts.push(new_account)
	puts "Your record has been created succesfully."
	main_menu_return
end

def main_menu_return
	puts "Do you want to return to the Main Menu [Y or N]"
	choice = gets.chomp.upcase

	case choice
		when "Y"
			system "clear"
			main_menu
		when "N"
			end_session
		else
			system "clear"
			puts "Not a valid selection.[Y or N]"
			main_menu_return
	end
end

def account_login
	puts "Employee Account Login"
	puts "--------------"
	puts "Please provide the name on the account:"
	name = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts = "What's your role?"
	role = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts = "What location?"
	location = gets.chomp.downcase.split.map(&:capitalize).join(' ')

	acct_found = false
	@accounts.each do |acct|
		if acct.name == name && acct.role == role && acct.location == location
			puts "Login Successful"
			existing_account_menu(acct)
			acct_found = true
		end
	end

	if acct_found == false
		system "clear"
		puts "No account found with those credentials. Try again."
		account_login
	end
end

def existing_record_menu(acct)
	puts "Your Employee Account Menu"
	puts "-------------------------"
	puts "1. Check Clock-In Hours"
	puts "2. Transfer, to a new Location"
	puts "3. Return to Main Menu"
	choice = gets.chomp.to_i

	case choice
		when 1
			system "clear"
			check_hours(acct)
		when 2
			system "clear"
			make_transfer(acct)
		when 3 
			system "clear"
			main_menu
		else
			system "clear"
			puts "Not a valid selection. Try again."
			existing_account_menu(acct)
	end
end

def check_hours(acct)
	puts "Your current hours are #{acct.hours}"
	existing_account_menu(acct)
end

def make_transfer(acct)
	prints "What new location?"
	location = gets.chomp.uppercase
	acct.transfer(location)
	puts "Your new location is #{acct.location}"
	existing_account_menu(acct)
	#if location == acct.transfer
		#existing_account_menu(acct)
	#else
		#system "clear"
		#puts "Wrong input."
		#existing_account_menu(acct)
	#end
end

def existing_record_return(acct)
	puts "Return to.."
	puts "------------"
	puts "1. Account Menu"
	puts "2. Main Menu"
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice
		when 1
			system "clear"
			existing_account_menu(acct)
		when 2
			system "clear"
			main_menu
		when 3
			end_session
		else
			system "clear"
			puts "Not a valid selection. Try again."
			existing_account_return(acct)
	end
end

def end_session
	system "clear"
	puts "Thanks for stopping by at Apt-Two Employee Portal"
end

main











































	