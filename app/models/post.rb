class Post < ApplicationRecord
    belongs_to :user
    # validates :title, presence: true,
    #                 length: { minimum: 5 }
    
    #apply
    has_many :applies
    has_many :applied_users, through: :applies, source: :user
end
