module HeadingsHelper

  def headings(headings_list)
    max_depth = 0
    headings_list.each do |element|
      max_depth = element[:heading_level] if element[:heading_level] > max_depth
    end

    depth_array = []
    headings_list.each do |element|
      depth_array << element[:heading_level]
    end

    counters_array = []
    depth_array.each do |element|
      counters_array << []
      (max_depth + 1).times do |time|
        if element < time
          counters_array[-1] << 0
        else
          counters_array[-1] << 1
        end
      end
    end

    sums_array = []
    counters_array.transpose.each do |element|
      sums_array << element.inject(0, :+)
    end

    counters = []
    sums_array.each do |element_sum|
      counters << []
      element_sum.times do |time|
        counters[-1] << time + 1
      end
    end

    strings_array = []
    headings_list.each_with_index do |element, index|
      strings_array[index] = ""
      depth = element[:heading_level]
      (depth + 1).times do |time|
        item_value = counters[time].shift
        strings_array[index] += item_value.to_s + '.'
      end
    end

    strings_array
  end

end
