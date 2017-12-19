import urllib.request
import urllib.error
import json

def btc2eur_uncached(btc, date=None):
    # https://www.coindesk.com/api/ <3

    if date is None:
        API_URL = "https://api.coindesk.com/v1/bpi/currentprice.json"
    else:
        API_URL = "https://api.coindesk.com/v1/bpi/historical/close.json?start=%s&end=%s&currency=EUR" % (date, date)

    try:
        request = urllib.request.urlopen(API_URL)
    except urllib.error.HTTPError:
        return float('nan')
    response_raw = request.read()
    response = json.loads(response_raw)
    if date is None:
        rate = response['bpi']['EUR']['rate_float']
    else:
        rate = response['bpi'][date]
    return btc * rate
