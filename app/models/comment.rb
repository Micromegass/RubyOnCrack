# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  user_id          :integer
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :user


    validates :body, presence: true
    validates :commentable_type, :commentable_id, :user_id, :body, presence: true
end
