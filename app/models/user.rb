class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
   # self в правой части можно опустить
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format:   { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }


  # Возвращает дайджест для указанной строки.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
             BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    # Возвращает случайный токен.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

end
