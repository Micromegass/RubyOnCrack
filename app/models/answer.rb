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
  belongs_to :question, dependent: :destroy
  belongs_to :user

  validates :body, presence: true
end
