class Article < ActiveRecord::Base
  belongs_to :user

  acts_as_votable

  def score
    @score ||= self.get_upvotes.size

  end
end
