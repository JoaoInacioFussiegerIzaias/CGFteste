class Blog < ApplicationRecord
  has_many :blog_arquivos
  accepts_nested_attributes_for :blog_arquivos, allow_destroy: true

  validates :titulo, presence: true
  validates :descricao, presence: true
end
