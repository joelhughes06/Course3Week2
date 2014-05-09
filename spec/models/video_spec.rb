require 'spec_helper'

describe Title do
#	it "saves itself" do
#		video = Title.new(title: "Monk", description: "A great TV show!")
#		video.save
#		expect(Title.first).to eq(video)
#	end
	it { should belong_to(:category) }

#	it "belongs to category" do
#		dramas = Category.create(genre: "dramas")
#		monk = Title.create(title: "Monk", description: "A great show", category: dramas)
#		expect(monk.category).to eq(dramas)
#	end

	it { should validate_presence_of(:title) }

#	it "does not save a video without a title" do
#		video = Title.create(description: "A great ditty")
#		expect(Title.count).to eq(0)
#	end

	it { should validate_presence_of(:description) }

#	it "does not save a video without a description" do
#		video = Title.create(title: "Monnk")
#		expect(Title.count).to eq(0)
#	end

	describe "search_by_title" do 
		it "returns an empty array if there is no match" do 
			futurama = Title.create(title: 'Futurama', description: 'Space Travel')
			back_to_future = Title.create(title: 'Back to the Future', description: 'Time Travel')
			expect(Title.search_by_title('hello')).to eq([])
		end
		it "returns an array of one video for an exact match" do 
			futurama = Title.create(title: 'Futurama', description: 'Space Travel')
			back_to_future = Title.create(title: 'Back to the Future', description: 'Time Travel')
			expect(Title.search_by_title('Futurama')).to eq([futurama])
		end
		it "returns an array of one video for a partial match" do 
			futurama = Title.create(title: 'Futurama', description: 'Space Travel')
			back_to_future = Title.create(title: 'Back to the Future', description: 'Time Travel')
			expect(Title.search_by_title('urama')).to eq([futurama])
		end
		it "returns an array of all matches ordered by created_at" do 
			futurama = Title.create(title: 'Futurama', description: 'Space Travel', created_at: 1.day.ago)
			back_to_future = Title.create(title: 'Back to the Future', description: 'Time Travel')
			expect(Title.search_by_title('Futur')).to eq([back_to_future, futurama])
		end
		it "returns an empty array for a search within an empty string" do 
			futurama = Title.create(title: 'Futurama', description: 'Space Travel', created_at: 1.day.ago)
			back_to_future = Title.create(title: 'Back to the Future', description: 'Time Travel')
			expect(Title.search_by_title('')).to eq([])
		end			
	end

end