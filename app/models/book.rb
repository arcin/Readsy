class Book < ActiveRecord::Base
  scope :finished, ->{ where.not(finished_on: nil) }
  scope :recent, ->{ where('finished_on < ?', 2.days.ago) }
  scope :search, ->(keyword){ where("keywords LIKE ?", "%#{keyword.downcase}%") }

  before_save :set_keywords
  def finished?
    finished_on.present?
  end

  protected
  # make callbacks protected so they aren't part of the public api.
  # We dont want to call callback methods from controllers or views.
  def set_keywords
    self.keywords = [title, author, description].map(&:downcase).join(' ')
  end
end
