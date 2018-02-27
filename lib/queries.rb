# Write methods that return SQL queries for each part of the challeng here
require_relative '../db/seed.rb'

def guest_with_most_appearances
	"select name, count(name) from guests
	group by name 
	order by count(name) desc limit 1;"
end

def most_popular_profession_by_year
	"select year, occupation, max(counter) from 
	(select year, occupation, count(occupation) as counter from guests
	group by occupation, year
	order by count(occupation) desc)
	group by year;"
end

def most_common_profession
	"select occupation, count(occupation) from guests
	group by occupation
	order by count(occupation) desc limit 1;"
end

def guests_named_bill
	"select distinct name from guests
	where name like 'Bill%';"
end

def patrick_stewart_appearances
	"select name, show from guests
	where name = 'Patrick Stewart';"
end

def year_with_most_guests
	"select year, count(*) from guests
	group by year
	order by count(*) desc limit 1;"
end

def most_popular_group_by_year
	"select year, group_, max(counter) from 
	(select year, group_, count(group_) as counter from guests
	group by group_, year
	order by count(group_) desc)
	group by year;"
end





def run_questions
	# creates db in memory
	db = create_db

	puts "\nMost Appearances", db.execute(guest_with_most_appearances).inspect
	puts "\nMost Popular Professions By Year", db.execute(most_popular_profession_by_year).inspect
	puts "\nMost Common Profession", db.execute(most_common_profession).inspect
	puts "\nGuests Named Bill", db.execute(guests_named_bill).inspect
	puts "\nPatrick Stewart Appearances", db.execute(patrick_stewart_appearances).inspect
	puts "\nYear With Most Guests", db.execute(year_with_most_guests).inspect
	puts "\nMost Popular Groups By Year", db.execute(most_popular_group_by_year).inspect



end

run_questions