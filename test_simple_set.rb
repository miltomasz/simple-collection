require "smart_set"
require "test/unit"

class TestSmartCollectionsSet < Test::Unit::TestCase
		def setup
				@smart_set = SmartCollection::Set.new
		end

		def teardown
		end

		def test_initialize_set
				assert_not_nil @smart_set
		end

		def test_add_element_to_set
				element = 10

				@smart_set.add(element)
				assert_equal(1, @smart_set.size)
		end

		def test_remove_element_from_set
				element = 10

				@smart_set.add(element)
				@smart_set.remove(element)

				assert_equal(0, @smart_set.size)
		end

		def test_add_2_elements
				element1, element2 = 10, 20

				@smart_set.add(element1)
				@smart_set.add(element2)

				assert_equal(2, @smart_set.size)
		end

		def test_removing_element_when_size_2
				element1, element2 = 10, 20

				@smart_set.add(element1)
				@smart_set.add(element2)
				@smart_set.remove(element1)

				assert_equal(1, @smart_set.size)
		end

		def test_iterate_through_set
				element1, element2 = 10, 20

				@smart_set.add(element1)
				@smart_set.add(element2)  

				assert_equal([10,20], @smart_set.to_a)
		end

		def test_add_existing_element
				element1, element2, element3 = 10, 20, 30

				@smart_set.add(element1)
				@smart_set.add(element2)  
				@smart_set.add(element1)
				@smart_set.add(element3)
				@smart_set.remove(element2)

				assert_equal([10,30], @smart_set.to_a)
		end

		def test_add_all
				other_collection = [10,20,30]

				@smart_set.add(1)
				@smart_set.add(5)
				@smart_set.add_all(other_collection)
				@smart_set.add(30)

				assert_equal([1,5,10,20,30], @smart_set.to_a)
		end

		def test_clear_set
				other_collection = ["a", "b", "c"]

				@smart_set.add_all(other_collection)
				@smart_set.clear

				assert_equal([], @smart_set.to_a)
		end

		def test_contains_element
				other_collection = ["a", "b", "c"]

				@smart_set.add_all(other_collection)

				assert(@smart_set.contains? "a")
		end

		def test_not_contains_element
				other_collection = ["a", "b", "c"]

				@smart_set.add_all(other_collection)
				@smart_set.remove("a")

				assert(!(@smart_set.contains? "a"))
		end

		def test_contains_other_collection
				set = ["a", "b", "c", "d"]
				other_set = SmartCollection::Set.new

				@smart_set.add_all(set)
				other_set.add("a")
				other_set.add("d")

				assert(@smart_set.contains_all? other_set)
		end

		def test_equality_of_two_sets
				set = ["a", "b", "c", "d"]
				other_set = SmartCollection::Set.new

				@smart_set.add_all(set)
				other_set.add_all(set)

				assert(@smart_set == other_set)
		end

		def test_not_equality_of_two_sets
				set = ["a", "b", "c", "d"]
				other_set = SmartCollection::Set.new

				@smart_set.add_all(set)
				other_set.add_all(["b", "c", "d", "a"])

				assert_equal(false, @smart_set == other_set)
		end

		def test_emptiness_of_set
				set = []
				@smart_set.add_all(set)

				assert(@smart_set.empty?)
		end

		def test_removing_all_elements
				set = ["a", "b", "c", "d"]
				other_set = SmartCollection::Set.new

				@smart_set.add_all(set)
				other_set.add_all(["a", "c"])
				@smart_set.remove_all(other_set)

				assert_equal(["b", "d"], @smart_set.to_a)
		end

		def teardown
				@smart_set = nil
				
		end
end