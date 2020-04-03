module ItemsHelper
  def converting_to_jpy(price)
    "#{price.to_s(:delimited)}円"
  end
end
