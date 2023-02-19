class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
    has_many :articles, dependent: :destroy
    has_secure_password
end
