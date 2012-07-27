module SmartCollection
	class Set
		include  Enumerable


		def initialize
			@collection = {}
		end

		def add element
			@collection[element] = true if @collection[element].nil?
		end

		def size
			@collection.size
		end

		def remove element
			@collection.delete element
		end

		def each &block
			@collection.each do |k,v| 
				unless v.nil?
					block.call(k,v)
				end 
			end
			@collection.keys
		end

		def add_all array = Array.new
			hash = Hash.new
			array.each {|e| hash[e] = true }
			@collection.update(hash)
		end

		def clear
			@collection.clear
		end

		def contains? element
			@collection.has_key? element
		end

		def contains_all? other_set
			keys = @collection.keys
			other_keys = other_set.to_a
			new_size = (keys + other_keys).size
			new_size > keys.size
		end

		def == other_set
			@collection.keys == other_set.to_a
		end

		def empty?
			@collection.keys.empty?
		end

		def to_a
			@collection.keys
		end


		def remove_all elements
			elements.each do |e|
				@collection.delete e
			end
		end
	end
end
