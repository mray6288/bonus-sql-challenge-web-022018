require 'csv'
require 'sqlite3'
require 'pry'


def csv_to_array(file_name)
	array = []
	CSV.foreach(file_name) {|line| array <<  line}
	array
end

def create_db
	guests = csv_to_array('daily_show_guests.csv')
	# binding.pry 
	guests.shift



	db =SQLite3::Database.new(":memory:")

	db.execute <<-SQL
		create table guests (
			'id' INTEGER PRIMARY KEY,
			'year' integer,
			'occupation' text,
			'show' text,
			'group_' text,
			'name' text
		);
	SQL


	guests.each do |guest|
	  db.execute("INSERT INTO guests (year, occupation, show, 'group_', name)
	  			VALUES (?, ?, ?, ?, ?)", [guest[0], guest[1], guest[2], guest[3], guest[4]])
	  			# VALUES ({guest[0]}, #{guest[1]}, #{guest[2]}, #{guest[3]}, #{guest[4]})")
	            # VALUES (?, ?, ?, ?)" [guest[0], guest[1], guest[2], guest[3]])


	            # (${guest[0]}, ${guest[1]}, ${guest[2]}, ${guest[3]}, ${guest[4]})")
	end
	db
end

