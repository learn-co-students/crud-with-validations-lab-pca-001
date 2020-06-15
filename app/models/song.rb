class Song < ApplicationRecord
  include ActiveModel::Validations

  validates :title, presence: true
  validates_with TitleValidator
  validates :release_year,
            presence: true,
            numericality: { less_than_or_equal_to: Time.now.year },
            if: proc { |s| s.released }
  validates :artist_name, presence: true
end

def released?
  released
end
