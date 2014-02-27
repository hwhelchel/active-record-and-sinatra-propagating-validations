class Event < ActiveRecord::Base
  DATE_REGEX = /\A(19|20)\d{2}([- \/\.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])\z/
  EMAIL_REGEX = /[a-zA-Z0-9_\.\+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+/

  validates_presence_of :date, :title, :organizer_name
  validates_format_of :date, with: DATE_REGEX
  validate :event_date_cannot_be_in_past
  validates_format_of :organizer_email, with: EMAIL_REGEX
  validates_uniqueness_of :title

  def event_date_cannot_be_in_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
