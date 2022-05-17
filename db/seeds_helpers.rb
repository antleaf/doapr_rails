def getBusinessModel(name)
  businessModel = BusinessModel.find_by_name(name)
  if businessModel == nil then
    businessModel = BusinessModel.find_by_name('_unknown')
  end
  return businessModel
end

def getStatus(name)
  status = Status.find_by_name(name)
  if status == nil then
    status = Status.find_by_name('_unknown')
  end
  return status
end

def getCountry(name)
  country = Country.find_by_name(name)
  if country == nil then
    country = Country.find_by_name('_unknown')
  end
  return country
end

def getPlatform(name)
  platform = Platform.find_by_name(name)
  if platform == nil then
    platform = Platform.find_by_name('_unknown')
  end
  return platform
end