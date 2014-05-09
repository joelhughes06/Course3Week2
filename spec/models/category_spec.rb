require 'spec_helper'

describe Category do
#	it "saves itself" do
#		category = Category.new(genre: "Comedies")
#		category.save
#		expect(Category.first).to eq(category)
#	end



#	it "has many videos" do
#		comedies = Category.create(genre: "Comedies")
#		the_other_woman = Title.create(title: "The Other Woman", description: "After discovering her boyfriend is married, Carly soon meets the wife he has been cheating on. And when yet another affair is discovered, all three women team up to plot mutual revenge.", category: comedies)
#		dom_hemingway = Title.create(title: "Dom Hemingway", description: "After spending 12 years in prison for keeping his mouth shut, notorious safe-cracker Dom Hemingway is back on the streets of London looking to collect what he is owed.", category: comedies)
#		expect(comedies.titles).to eq([dom_hemingway, the_other_woman])
#	end

	it { should have_many(:titles)}

end

	describe "#recent_videos" do
		it "returns the videos in the reverse chronological order by created_at" do
			comedies=Category.create(genre: "comedies")
			futurama=Title.create(title: "Futurama", description: "Space Travel", category_id: "1", created_at: 3.days.ago)
			south_park=Title.create(title: "South Park", description: "Crazy kids", category_id: "1", created_at: 2.days.ago)
			expect(comedies.recent_videos).to eq([south_park, futurama])
		end

		it "returns all the videos if there are fewer than 6 videos" do
			comedies=Category.create(genre: "comedies")
			futurama=Title.create(title: "Futurama", description: "Space Travel", category_id: "1", created_at: 1.day.ago)
			south_park=Title.create(title: "South Park", description: "Crazy kids", category_id: "1", created_at: 2.days.ago)
			expect(comedies.recent_videos.count).to eq(2)
		end

		it "returns 6 videos if there are more than 6 videos" do
			comedies=Category.create(genre: "comedies")
			futurama=Title.create(title: "Futurama", description: "Space Travel", category_id: "1", created_at: 1.day.ago)
			south_park=Title.create(title: "South Park", description: "Crazy kids", category_id: "1", created_at: 2.days.ago)
			6.times {Title.create(title: "foo", description: "bar", category: comedies)}
			tonights_show=Title.create(title: "Tonights show", description: "Talk show", category: comedies, created_at: 1.day.ago)
			expect(comedies.recent_videos.count).to eq(6)
		end

		it "returns the most recent 6 videos" do
			comedies=Category.create(genre: "comedies")
			futurama=Title.create(title: "Futurama", description: "Space Travel", category_id: "3", created_at: 1.day.ago)
			south_park=Title.create(title: "South Park", description: "Crazy kids", category_id: "3", created_at: 2.days.ago)
			7.times {Title.create(title: "foo", description: "bar", category: comedies)}
			tonights_show=Title.create(title: "Tonights show", description: "Talk show", category: comedies, created_at: 1.day.ago)
			expect(comedies.recent_videos).not_to include(tonights_show)
		end


		it "returns an empty array if the category does not have any videos" do
			comedies=Category.create(genre: "comedies")
			expect(comedies.recent_videos).to eq([])
		end
	end
	