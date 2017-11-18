class Article < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20}
	belongs_to :user
	before_save :set_visit_count


	def update_visit_count
		self.update(visit_count: visit_count + 1)
	end


	private

	def set_visit_count
		self.visit_count ||= 0
	end
end
