Geocoder.configure(

    # street address geocoding service (default :nominatim)
    lookup: :google,

    # to use an API key:
    api_key: "AIzaSyCQe2mR4WlvRZcn0O3VkFz7yOs-sIlRS6w",

    # geocoding service request timeout, in seconds (default 3):
    timeout: 5,

    # set default units to kilometers:
    units: :km

)