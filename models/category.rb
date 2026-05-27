class Category < ActiveRecord::Base

    has_many :posts
    has_many :metas, as: :mettaable

end
