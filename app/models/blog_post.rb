class BlogPost < ActiveRecord::Base
  validates :title, presence: true
  has_and_belongs_to_many :legal_cases
  has_and_belongs_to_many :users
  has_and_belongs_to_many :issues
  has_paper_trail
  acts_as_taggable

  translates :title, :body

  accepts_nested_attributes_for :translations, allow_destroy: true

  include Updates
end
