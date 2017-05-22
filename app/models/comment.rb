class Comment < ApplicationRecord
	belongs_to :dispatch, required: true, inverse_of: :comments
end
