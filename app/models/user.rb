class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # #2
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }

  # #3
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # #4
  validates :password, presence: true, length: { minimum: 6 }, if: -> { "password_digest.nil?" }
  validates :password, length: { minimum: 6 }, allow_blank: true
  # #5
  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 254 }

  # #6
  has_secure_password

  enum role: [:member, :admin]

  def set_uppercase
    name_array = []
    if name != nil
      name.split.each do |name_part|
        next if name_part == nil
        name_array << name_part.capitalize
      end

      self.name = name_array.join(" ")
    end
  end

  after_save  :set_uppercase
end
