module ProductsHelper


  def procucts_for_category(c)
    if c.nil? || c['category_id'] == ""
      Product.all
    else
      Product.all.where("category_id = #{c['category_id']}" )
    end
  end

  def category_name(c)
    if c.nil? || c['category_id'].empty?
      "All"
    else
      "#{Category.find(c['category_id']).name}"
    end
  end

end
