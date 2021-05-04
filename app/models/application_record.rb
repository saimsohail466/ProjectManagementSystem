class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def titleize_text(text)
    text = text.downcase.titleize
  end
end
