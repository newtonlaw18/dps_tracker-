class Dispatch < ApplicationRecord
	belongs_to :user, required: true
	has_many :comments, dependent: :destroy, inverse_of: :dispatch

	accepts_nested_attributes_for :comments #, reject_if: proc { |attributes| attributes[:body].blank? }, allow_destroy: true

	self.per_page = 10
end
