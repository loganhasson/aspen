require_relative '../config/environment'

class AspenTemplate

  def self.tree(hash, direc)
    @@direc = direc
    self.tree_gen(hash).flatten.unshift("").uniq
  end

  def self.tree_gen(hash, root="")
    folders_array = hash.collect do |key, value|
      if value.size == 0
        "#{root}/#{key}"
      elsif value.is_a?(Array)
        AspenFile.new(@@direc, "#{root}", value)
        "#{root}"
      else
        self.tree_gen(value, "#{root}/#{key}")
      end
    end
  end

end