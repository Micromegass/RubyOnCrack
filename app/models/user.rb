# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string(100)
#  password_digest :string
#  name            :string(100)
#  username        :string(50)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :questions, dependent: :destroy

    has_secure_password validations: false 

    validates :email, uniqueness: true, format: /@/
    validates :password, presence: true, on: :create
    validates :password, length: {in: 6..20 }, allow_nil: true
    validates :name, presence: true
    validates :username, presence: true
 

end
