class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "パスワードは半角英数を両方含む必要があります" }
  # validate :validate_password, on: :create
  validate :validate_full_width_name, on: :create
  validate :validate_full_width_kana, on: :create

  private
  # def validate_password
  #   unless /\A[a-zA-Z0-9]+\z/ =~ password
  #     errors.add(:base, 'パスワードは半角英数字で入力してください。')
  #   end
  # end

  def validate_full_width_name
    unless /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ =~ first_name_kanji && /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ =~ last_name_kanji
      errors.add(:base, 'お名前(全角)は全角（漢字・ひらがな・カタカナ）で入力してください。')
    end
  end

  def validate_full_width_kana
    unless /\A[ァ-ヶー]+\z/ =~ first_name_kana && /\A[ァ-ヶー]+\z/ =~ last_name_kana
      errors.add(:base, 'お名前カナ(全角)は全角（カタカナ）で入力してください。')
    end
  end
end
