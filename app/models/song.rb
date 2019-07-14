class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year} 
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released
    validate :release_year_validation, if: :release_year

def release_year_validation
    if release_year > Time.current.year
        errors[:release_year] << 'Wrong!'
    end
end


end
