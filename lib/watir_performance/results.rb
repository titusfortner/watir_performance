module WatirPerformance
  class Results

    WD_ONLY_FINDERS = [:link_text,
                       :partial_link_text]

    WD_FINDERS = [:class_name,
                  :id,
                  :name,
                  :tag_name]

    CSS_FINDERS = [:css_id,
                   :css_class,
                   :css_tag,
                   :css_attribute,
                   :css_value]

    XPATH_FINDERS = [:xpath_id,
                     :xpath_class,
                     :xpath_tag,
                     :xpath_attribute,
                     :xpath_value]


    WATIR_FINDERS = [:href,
                     :text,
                     :data_text,
                     :hreflang]

    WATIR_REGEX_FINDERS = [:text_regex,
                           :href_regex,
                           :data_text_regex,
                           :hreflang_regex]


    def initialize
      WD_FINDERS.each do |how|
        instance_variable_set("@#{how}_wd_array", [])
        instance_variable_set("@#{how}_watir_array", [])
        instance_variable_set("@#{how}_regex_array", [])
      end
    end


    WD_FINDERS.each do |how|

      define_method("#{how}_watir") do
        eval("@#{how}_watir_array").mean
      end

      define_method("#{how}_wd") do
        eval("@#{how}_wd_array").mean
      end

      define_method("#{how}_regex") do
        eval("@#{how}_regex_array").mean
      end

      define_method("#{how}_wd_watir") do
        watir = eval("#{how}_watir")
        wd = eval("@#{how}_wd")
        wd == 0 ? 0 : 100 * (watir - wd) / wd
      end

      define_method("#{how}_watir_regex") do
        regex = eval("#{how}_regex")
        watir = eval("@#{how}_watir")
        watir == 0 ? 0 : 100 * (regex - watir) / watir
      end

      define_method("#{how}_wd=") do |value|
        eval("@#{how}_wd_array") << value
      end

      define_method("#{how}_watir=") do |value|
        eval("@#{how}_watir_array") << value
      end

      define_method("#{how}_regex=") do |value|
        eval("@#{how}_regex_array") << value
      end
    end


    def to_s
      s = ''
      WD_FINDERS.each do |locator|
        s << "#{locator} - Watir: #{eval("#{locator}_watir").round(4)}ms; WD: #{eval("#{locator}_wd").round(4)}ms" \
        " -- #{eval("#{locator}_wd_watir").round(0)}% performance hit;" \
        " Regex: #{eval("#{locator}_regex").round(4)}ms -- #{eval("#{locator}_watir_regex").round(0)}% performance hit;\n"
      end
      s
    end

  end
end