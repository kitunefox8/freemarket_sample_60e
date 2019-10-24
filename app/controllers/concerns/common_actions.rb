module CommonActions
  extend ActiveSupport::Concern
  def set_categories
    @categories = Category.all.where(ancestry: nil)
  end
end