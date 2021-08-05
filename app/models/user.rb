class User < ApplicationRecord
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true

    enum user_status: [:unarchived, :archived]
end
