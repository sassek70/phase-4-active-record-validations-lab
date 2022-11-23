class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}

    #options for checking if a key includes something.
        #using in: Array
        validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

        #using % notation - %w() turns items in parenthesis into strings in an array - short hand
        validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validates :title, exclusion: { in: ["True Facts"]}



    #from solution branch using Regex - Look into for the future
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top \d/i,
      /Guess/i
    ]
  
    def clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end

end
