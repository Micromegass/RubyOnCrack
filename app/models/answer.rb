# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  body        :text
#  question_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#

class Answer < ApplicationRecord
  validates :body, presence: true, length: {minimum:1, maximum:1000}

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  
end
