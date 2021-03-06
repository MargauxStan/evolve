class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_programs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :final_test_answers, dependent: :destroy
  has_many :quizz_scores, dependent: :destroy
  has_one_attached :photo
  validates :username, presence: true

  def name
    self.username + " - lev " + self.level.to_s
  end

  def global_stats
    ((self.level.to_f * 1000).to_f + self.xp).to_f / 100.to_f
  end

  def count_inprogress
    @nb_inprogress = UsersProgram.where(user: self, status: "in progress")
    @nb_inprogress.count
  end

  def count_done
    @nb_done = UsersProgram.where(user: self, status: "done")
    @nb_done.count
  end

  def consecutive_days?
    (Date.today - last_sign_in_at.to_date).to_i == (days_streak)
  end
  def more?
    (Date.today - last_sign_in_at.to_date).to_i < (days_streak)
  end

  def add_xp(number)
    self.xp += number
    if self.xp >= 1000
      self.xp -= 1000
      self.level += 1
    end
  end
end
