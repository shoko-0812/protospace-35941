class Comment < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :user, optional: true
  belongs_to :Prototype, optional: true
  
end
