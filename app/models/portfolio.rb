class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies,
                                  reject_if: lambda { |attr| attr['name'].blank?}

    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.react
      where(subtitle: "React")
    end

    scope :ruby_on_rails_portfolio_items, -> {  where(subtitle: "Ruby on Rails") } # a lambda
    after_initialize :set_defaults

    def set_defaults
      self.main_image ||= "http://placehold.it/600x400"
      self.thumb_image ||= "http://placehold.it/350x200"
    end
end
