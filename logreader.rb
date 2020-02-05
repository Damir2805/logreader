# This program is to alert about NOK events

#We should define the file path to events.log
#file_path = "./Rubyprojects/Logreader/events.log"



#Infinitive loop of reading log file
loop do 

	file_path = "./Data/events.log"

	times = [0]
	
	content = File.new(file_path, "r:UTF-8")
	f = content.read.downcase.split

	results = f.select{|item| item.include?("nok")}
	nok_counter = results.size
	times << nok_counter
	times1 = times.reverse

	puts
	puts times
	puts times1
	puts

	#times_per_minuite = (times1[2] - times1[1])

	#puts f
	puts nok_counter
	#puts times_per_minuite

	sleep 20	

end
#I need to add an element to the array in the tail.
#And I need delete the first element in the array