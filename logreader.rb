# This program is to alert about NOK events

#Infinitive loop of reading log file
loop do 

	file_path1 = "./Data/events.log"
	file_path2 = "./Data/alerts"

	#Reading the log file	
	content = File.new(file_path1, "r:UTF-8")
	f = content.read.downcase.split

	results = f.select{|item| item.include?("nok")}
	nok_counter = results.size

	#Adding data into a different file
	alerts = File.new(file_path2, "a:UTF-8")
	alerts.print "#{nok_counter}\n\r"
	alerts.close

	#Reading recorded data and counting NOK events
	alerts = File.new(file_path2, "r:UTF-8")
	als = alerts.read.split.compact.reverse
	
	alerts.close

	#Counting difference between two last numbers which shows a number
	#of NOK events
	a1 = als[0].to_i
	a2 = als[1].to_i

	alerts_counter = a1 - a2

	puts
	
	puts "There were #{alerts_counter} NOK events per last minute"

	sleep 20	

end
