# encoding: utf-8

class StringHelper
  def self.generate_code(length)
    rand(36**length).to_s(36)
  end

  def self.generate_safe_string(input)
    output = input.strip.downcase

    regexes = [
      { regex: /\s*&\s*/, replace: "" },
      { regex: /[\\ş]/i, replace:"s" },
      { regex: /[\\ğ]/i, replace:"g" },
      { regex: /[\\ü]/i, replace:"u" },
      { regex: /[\\ı]/i, replace:"i" },
      { regex: /[\\ö]/i, replace:"o" },
      { regex: /[\\ç]/i, replace:"c" },
      { regex: /\s*[^A-Za-z0-9\.\-]\s*/, replace: "" },
      { regex: /_+/, replace:"" },
      { regex: /\A[_\.]+|[_\.]+\z/, replace: "" },
      { regex: /\./i, replace: "" }
    ]

    regexes.each do |item|
      output.gsub!(item[:regex], item[:replace])
    end

    output
  end

  def self.generate_slug(input)
    output = input.strip.downcase

    regexes = [
      { regex: /['`]/, replace: "" },
      { regex: /\s*&\s*/, replace: " ve " },
      { regex: /[\\ş]/i, replace:"s" },
      { regex: /[\\ğ]/i, replace:"g" },
      { regex: /[\\ü]/i, replace:"u" },
      { regex: /[\\ı]/i, replace:"i" },
      { regex: /[\\ö]/i, replace:"o" },
      { regex: /[\\ç]/i, replace:"c" },
      { regex: /\s*[^A-Za-z0-9\.\-]\s*/, replace: "-" },
      { regex: /_+/, replace:"-" },
      { regex: /\A[_\.]+|[_\.]+\z/, replace: "" },
      { regex: /\./i, replace: "" }
    ]

    regexes.each do |item|
      output.gsub!(item[:regex], item[:replace])
    end

    output
  end

  def self.generate_unique(length=10)
    chars = [('a'..'z'), (1..9)].map { |i| i.to_a }.flatten
    unique = (0...length).map{ chars[rand(chars.length)] }.join
  end

  def self.parse_sentences(raw_text)
    result = []
    sentences = raw_text.split(".")

    sentences.each do |item|
      result << item.strip + "."
    end

    result
  end
end