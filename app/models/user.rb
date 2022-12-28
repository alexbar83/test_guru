class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable,
         :validatable,
         :trackable,
         :confirmable
         
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy

  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(levels)
    tests.where(level: levels)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
