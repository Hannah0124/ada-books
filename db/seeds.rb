# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# reference: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/db-seeds.md
# https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/code_samples/seeds.rb

input_books = [
  {
    title: "Between The World and Me",
    author: "Ta-Nehisi Coates",
    # publication_date: 2015,
  },
  {
    title: "Bad Feminist",
    author: "Roxane Gay",
    # publication_date: 2014,
  },
  {
    title: "Hidden Figures",
    author: "Margot Lee Shetterly",
    description: "The phenomenal true story of the black female mathematicians at NASA",
    # publication_date: 2016,
  },
  {
    title: "Practical Object-Oriented Design in Ruby",
    author: "Sandi Metz",
    description: "A great book on object-oriented design",
    # publication_date: 2012,
  },
  {
    title: "99 Bottles of OOP",
    author: "Sandi Metz",
    description: "An even more in-depth book on object-oriented design",
    # publication_date: 2016,
  },
]

input_authors = [
  {
    name: "Sandi Metz",
  },
  {
    name: "Ta-Nehisi Coates",
  },
  {
    name: "Margot Lee Shetterly",
  },
  {
    name: "Roxane Gay",
  },
]

author_failures = []
input_authors.each do |input_author|
  author = Author.new(name: input_author[:name])
  successful = author.save
  if successful
    puts "Created author: #{author.inspect}"
  else
    author_failures << author
    puts "Failed to save author: #{author.inspect}"
  end
end

puts "Added #{Author.count} author records"
puts "#{author_failures.length} authors failed to save"

book_failures = []
input_books.each do |input_book|
  book = Book.new
  book.title = input_book[:title]
  book.description = input_book[:description]
  # book.publication_date = input_book[:publication_date]
  book.author = Author.find_by(name: input_book[:author])
  successful = book.save
  if successful
    puts "Created book: #{book.inspect}"
  else
    book_failures << book
    puts "Failed to save book: #{book.inspect}"
  end
end

puts "Added #{Book.count} book records"
puts "#{book_failures.length} books failed to save"





# authors = [
#   {
#     name: "Margot Lee Shetterly",
#     # bio_url: "https://en.wikipedia.org/wiki/Roxane_Gay"
#   },
#   {
#     name: "Sandi Metz",
#     # bio_url: "https://en.wikipedia.org/wiki/Sandi_Metz"
#   },
#   {
#     name: "Octavia E. Butler",
#     # bio_url: "https://en.wikipedia.org/wiki/Octavia_E._Butler"
#   },
#   {
#     name: "Jim Butcher",
#     # bio_url: "https://en.wikipedia.org/wiki/Jim_Butcher"
#   }
# ]

# # authors.each do |author|
# #   Author.create(author)
# # end

# # same as above
# Author.create(authors)

# books = [
#   {
#     title: "Practical Object Oriented Design in Ruby",
#     description: "This book explores Object-Oriented concepts in Ruby.",
#     author_id: (Author.find_by name: "Sandi Metz").id,
#     # publication_date: 2020
#   },
#   {
#     title: "An Untamed State",
#     description: "The novel explores the interconnected themes of race, privilege, sexual violence, family, and the immigrant experience. An Untamed State is often referred to as a fairy tale because of its structure and style, especially in reference to the opening sentence, \"Once upon a time, in a far-off land, I was kidnapped by a gang of fearless yet terrified young men with so much impossible hope beating inside their bodies it burned their very skin and strengthened their will right through their bones,\" and the author's exploration of the American dream and courtship of Mireille's parents",

#     # Accessing database right away here!!!
#     author_id: (Author.find_by name: "Margot Lee Shetterly").id,
#     # publication_date: 2014
#   },
#   {
#     title: "Storm Front",
#     description: "Dirty Harry Potter",
#     author_id: (Author.find_by name: "Jim Butcher").id,
#     # publication_date: 2000
#   },    
# ]

# # books.each do |book|
# #   Book.create(book)
# # end

# # same as above
# Book.create(books)