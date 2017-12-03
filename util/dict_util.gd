static func shallow_copy (dict):
  var new_dict = {}
  for key in dict.keys():
    new_dict[key] = dict[key]
  return new_dict
