class Bookmark < ApplicationRecord
  belongs_to :review
  belongs_to :user


# makes sure bookmark is unique. One bookmark per user, per review
# scope of each review is unique based on each user.. making sure we have one review per user
  validates :review, uniqueness: {scope: user}
end
