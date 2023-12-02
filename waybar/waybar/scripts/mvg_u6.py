#!/usr/bin/env python3

import requests
from datetime import datetime
import json

station_map = {
    "Garching, Forschungszentrum": "GFZ",
    "Klinikum Großhadern": "KG",
}

kg: list[dict] = requests.get('https://www.mvg.de/api/fib/v2/departure', params={'globalId': 'de:09162:1540'}).json()
gfz: list[dict] = requests.get('https://www.mvg.de/api/fib/v2/departure', params={'globalId': 'de:09184:460'}).json()

def get_next_ubahn_info(departure_station_info, final_dst):
    ubahnen: list[dict] = filter(lambda x: x if x['label'].startswith('U') else None, departure_station_info)
    ubahnen = list(ubahnen)
    ubahnen = filter(lambda x: datetime.fromtimestamp(x['realtimeDepartureTime']/1000) > datetime.now(), ubahnen)
    ubahnen = filter(lambda x: x['destination'] == final_dst, ubahnen)

    ubahnen = [
        {'dst': x['destination'] if x['destination'] not in station_map else station_map[x['destination']],
         'label': x['label'],
         'time-remaining': int((datetime.fromtimestamp(x['realtimeDepartureTime']/1000) - datetime.now()).total_seconds() // 60),
         'cancelled': x['cancelled'],
         } for x in ubahnen]

    ubahnen.sort(key=lambda x: x['time-remaining'])

    text = ', '.join(
            [f"{x['label']}->{x['dst']}: {x['time-remaining']} min" for x in ubahnen[:1]])
    tooltip = '\n'.join(
            [f"{x['label']}->{x['dst']:3}: {x['time-remaining']:02} min" for x in ubahnen[:1]])

    return (text, tooltip)

text1, tooltip1 = get_next_ubahn_info(gfz, "Klinikum Großhadern")
text2, tooltip2 = get_next_ubahn_info(kg, "Garching, Forschungszentrum")

result = {
    'text': f"{text1} | {text2}",
    'tooltip': f"{tooltip1} | {tooltip2}",
}

print(json.dumps(result))

