class BlogArquivo < ApplicationRecord
  # Permições e Acossiações
  belongs_to :blog
  has_one_attached :imagem
  has_many_attached :imagens

  # Validations
  validates :titulo, presence: true
  validates :descricao, presence: true
end
