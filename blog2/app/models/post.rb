class Post < ActiveRecord::Base
 :title
  :body
  :category_id
  :author_id
  belongs_to :category
end
