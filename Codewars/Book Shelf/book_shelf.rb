# frozen_string_literal: true

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def get_title
    "Title: #{title}"
  end

  def get_author
    "Author: #{author}"
  end
end

pp = Book.new('Pride and Prejudice', 'Jane Austen')
h = Book.new('Hamlet', 'William Shakespeare')
wp = Book.new('War and Peace', 'Leo Tolstoy')



