# returns true or false, refactored.
class MakeTenCalculator

	def initialize(a, b, c, d, result)
		@helpers = []
		sorted_four_els = [a, b, c, d].sort
		p with_four_values(sorted_four_els, result)
	end

	# make sure to pass variables in order of size
	def with_two_values(two_els, result)
		p "two els #{two_els} #{result}"
		a, b = two_els[0], two_els[1]
		if a+b == result || a-b == result ||
		   a*b == result || (a%b == 0 && a/b ==result)
			return true
		else
			return false
		end
	end

	# ditto
	def with_three_values(three_els, result)
		a, b, c = three_els[0], three_els[1], three_els[2]
		p "three els #{three_els} #{result}"
		three_els.each_with_index do |el, i|
			result_arr = get_possible_helpers(el, result)
			result_arr.each do |res|
				if with_two_values(extract_indexed(i, three_els), res)
					return true
					exit
				end
			end
		end
		return false
	end

	def get_possible_helpers(a, result)
		if result%a == 0
			return [result+a, (result-a).abs, result*a, result/a].uniq
		else
			return [result+a, (result-a).abs, result*a].uniq
		end
	end

	def extract_indexed(i, arr)
		extracted_arr = []
		arr.each_with_index do |x, index|
			unless index == i
				extracted_arr << x
			end 
		end
		return extracted_arr
	end

	# ditto
	def with_four_values(four_els, result)
		unique_four_els = four_els.uniq
		p "unique #{unique_four_els}"
		unique_four_els.each_with_index do |x, i|
			@helper = get_possible_helpers(x, result)
			p "helper #{@helper}"
			@helper.each do |helper|
				if with_three_values(extract_indexed(i, four_els),
														 helper)
					return true
					exit
				end
			end
		end
		return false
	end

end

MakeTenCalculator.new(4,3,2,1,10)
MakeTenCalculator.new(1,1,1,1,10)
MakeTenCalculator.new(5,8,9,7,10)
