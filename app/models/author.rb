class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :books
  has_many :genres, -> { distinct }, through: :books

  # reference: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/model-logic.md
  def first_published
    books_with_year = self.books.where.not(publication_date: nil)
    first_book = books_with_year.order(publication_date: :asc).first
    if first_book
      return first_book.publication_date
    else
      return nil
    end
  end
end
