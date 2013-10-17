class AspenTemplate


  def self.tree(hash)
    self.tree_gen(hash).flatten.unshift("")
  end


  def self.tree_gen(hash, root="")
    folders_array = hash.collect do |key, value|
      if value.size == 0
        "#{root}/#{key}"
      else
        self.folders(value, "#{root}/#{key}")
      end
    end
  end


end