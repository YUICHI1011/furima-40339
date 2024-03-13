class User < ApplicationRecord
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ , message: "には英字と数字の両方を含めて設定してください" }
  validates :password, format: { without: /[^ -~｡-ﾟ]+/, message: "には半角文字のみを使用してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々]+\z/ , message: "は全角文字（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々]+\z/ , message: "は全角文字（漢字・ひらがな・カタカナ）で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true

  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
