require 'date'

recur = 30 #days after which a new bundle is allocated
term = 12 #months after the start date you will get data 
start_date = Date.new(2012,8,1) #when the promotion starts
end_date = Date.new(2013,2,6) #when the promotion ends

max_validity = 0 #sum of the validity periods of the bundles over the whole term
optimal_dates = [] #the start dates that give you max_validity

start_date.step(end_date, step=1) do |date|
	bundle_start = date
	validity_total = 0
	bundle_end = Date.new((date + term * recur >> 2).year, (date + term * recur >> 2).mon, 1) - 1 #initial value not important
	term.times do |n| # can't figure out how to use Date.step for this
		bundle_end = Date.new((bundle_start >> 2).year, (bundle_start >> 2).mon, 1) - 1
		validity_total += (bundle_end - bundle_start).to_i
		bundle_start += recur
	end
	puts "#{date} – #{bundle_end} (#{date + (term - 1) * recur}): #{validity_total}, #{(bundle_end - date).to_i}"
	if validity_total > max_validity
		max_validity = validity_total
		optimal_dates = [date]
		validity_test = [validity_total]
	elsif validity_total == max_validity
		optimal_dates = optimal_dates + [date]
		validity_test = validity_test + [validity_total]
	end
end

puts "Best validity period: #{max_validity}, on:"
puts optimal_dates