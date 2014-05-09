class TodosController<ApplicationController
	def index
		@todos = todo.all
	end

	def show
	end
	
end