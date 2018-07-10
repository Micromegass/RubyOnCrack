# == Schema Information
#
# Table name: questions
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#

class Question < ApplicationRecord
validates :title, presence: true
validates :description, presence: true, length: {minimum:10, maximum:10000}

belongs_to :user
has_many :comments, as: :commentable, dependent: :destroy
has_many :answers, dependent: :destroy
has_many :votes, as: :voteable, dependent: :destroy


def voted_by?(user)
  votes.exists?(user: user)
end

end
