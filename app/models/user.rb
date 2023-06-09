class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50, allow_blank: true }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
