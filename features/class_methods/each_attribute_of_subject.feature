Feature: each attribute of subject

  Use the each() method as a short-hand to generate a nested example group with
  a single example that specifies the expected value of each attribute of the
  subject.  This can be used with an implicit or explicit subject.

  each() accepts a symbol or a string, and a block representing the example.

      each(:item)     { is_expected.to be_an Item }
      each("article") { is_expected.to be_an Article }

  Scenario: specify value of each attribute
    Given a file named "example_spec.rb" with:
      """
      require "rspec-subject-extensions"

      class Movie
        def ratings
          [9, 7, 9]
        end
      end

      describe Movie do
        each(:rating) { is_expected.to be_an Integer }
      end
      """
    When I run `rspec example_spec.rb --format documentation`
    Then the output should contain:
      """
      Movie
        each rating
          should be a kind of Integer
      """
