class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ['Fiction', 'Non-Fiction'] 
    validate :title_contains_clickbait

    def title_contains_clickbait
        unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess"))
        errors.add(:title, "should be sufficiently clickbait-y")
        end
    end

end
