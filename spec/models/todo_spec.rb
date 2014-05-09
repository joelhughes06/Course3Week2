describe Todo 
	describe "#name_only?" do
		it "returns true if the description is nil" do 
			todo = Todo.new(name: "cook dinner")
			todo.name_only?.should be_true
		end

		it "returns true if the description is an empty string" do 
			todo = Todo.new(name: "cook dinner", description: "")
		end

		it "returns false if the description is a non-empty string" do 
			todo = Todo.new(name: "cook dinner", description: "potatoes")
			todo.name_only?.should be_false
		end
	end

