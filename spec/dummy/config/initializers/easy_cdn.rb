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
    libs: [ {
      name: 'test',
      version: '1.0.0',
      ext: 'js'
    },
    {
      name: 'test',
      version: '1.0.0',
      ext: 'css'
    } ],
    cdn: '//test/cdn/',
  },
]
