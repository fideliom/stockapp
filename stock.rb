def stock(array)
	profit = 0;
	sell = 0;
	buy = 0;
	array.each do |day|
		i = array.index(day)
		ifix = i
		until (i == array.size)
			potential = -array[ifix] + array[i]
			i += 1
			if (potential > profit)
				profit = potential
				sell = ifix
				buy = i - 1
			end
		end
	end
	return [sell, buy]
end

def pick
puts "Please enter the values of stock in this form :"
puts "'value1,value2,...,valueN'"
puts "For example : 17,13,15,12"
array = gets.chomp.split(',').map {|val| val.to_i}
if (stock(array) == [0, 0])
	puts "There are no possible profits"
else
	puts"--------------------------"
	p stock(array)
	puts "For maximum profit: (#{- array[stock(array)[0]] + array[stock(array)[1]]}$)"
	puts "Buy at day : #{stock(array)[0]+1}"
	puts "Sell at day : #{stock(array)[1]+1} "
	puts"--------------------------"
end
end

pick