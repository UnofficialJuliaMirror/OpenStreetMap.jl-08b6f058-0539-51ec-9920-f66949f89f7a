# Test reading in OSM data
module TestReadData

using OpenStreetMap
using Base.Test

MAP_FILENAME = "tech_square.osm"

if !isfile(MAP_FILENAME)
    url = "https://dl.dropboxusercontent.com/u/8297575/$MAP_FILENAME"
    download(url, MAP_FILENAME)
end

nodes, hwys, builds, feats = getOSMData(MAP_FILENAME, nodes=true, highways=true, buildings=true, features=true)

@test length(nodes) == 1410
@test length(hwys) == 55
@test length(builds) == 32
@test length(feats) == 4

map = parseMapXML(MAP_FILENAME)
bounds = getBounds(map)

@test_approx_eq bounds.min_lat 42.3626000
@test_approx_eq bounds.max_lat 42.3659000
@test_approx_eq bounds.min_lon -71.0939000
@test_approx_eq bounds.max_lon -71.0891000

end # module TestReadData
