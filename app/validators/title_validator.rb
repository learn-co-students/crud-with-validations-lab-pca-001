class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.class.where(title: record.title, release_year: record.release_year).empty?
      record.errors[:title] << "Must not release two #{record.class.to_s.pluralize} with the same name in the same year"
    end
  end
end
