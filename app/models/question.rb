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
has_many :answers, dependent: :destroy
belongs_to :user

validates :title, presence: true
validates :description, presence: true, length: {minimum:10, maximum:10000}

end
