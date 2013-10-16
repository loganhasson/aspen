class AspenTemplate

  def self.folders(hash, root="")

    folders_array = [""]
    hash.each do |key, value|
      if value.size == 0
        folders_array << "/#{key}"
      else
        value.each do 

    #process the hash into an array of directories with proper slashes

  end




# ["","/bin", "/config","/lib/models","/lib/concerns"]

# {
#   :bin => {},
#   :config => {},
#   :lib => {
#             :models => {},
#             :concerns => {
#                           :taco => {}
#                          }
#           }
# }

# {
#     :lib => [
#       :models, 
#       {:views => :layouts}
#     ],
#     :config
#   }
end