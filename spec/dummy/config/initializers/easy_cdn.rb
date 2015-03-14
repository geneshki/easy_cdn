# Add all cdn delivered assets here.
# Be sure to provide cdn url and version
# For smooth work of easy_cdn, please use the following structure:
#[ {
#  libs: [ {
#    name: 'jquery',
#    version: '2.1.3',
#    ext: 'js'
#  }]
#  cdn: '//ajax.googleapis.com/ajax/libs/jquery/',
#  },
#  ...
#]
Rails.application.config.assets.easy_cdn_config = [
  {
    lib: "test",
    cdn: '//test/cdn/1.0.0/',
    ext: "css"
  },
  {
    lib: "nocdn_test",
    ext: "css"
  },
  {
    lib: "test",
    local_dir: "no_cdn_subdir",
    ext: "css"
  },
  {
    lib: "test",
    cdn: '//test/cdn/1.0.0/',
    ext: "js"
  },
  {
    lib: "no_cdn_test",
    ext: "js"
  },
  {
    lib: "no_cdn_test",
    local_dir: "no_cdn_dir",
    ext: "js"
  },
  {
    lib: "test",
    local_dir: "subdir",
    cdn: '//test/cdn/1.0.0/',
    ext: "css"
  },
  {
    lib: "test",
    local_dir: "subdir",
    cdn: '//test/cdn/1.0.0/',
    ext: "js"
  },
]
