#!/usr/bin/env python3
"""Download quarterly US output and a housing-market indicator as raw JSON."""
from pathlib import Path
from urllib.request import urlopen

SERIES = ("OECD/QNA/USA.B1_GS1.LNBQRSA.Q", "OECD/MEI/USA.HOHWMN02.STSA.Q")
out = Path(__file__).with_name("data_raw")
out.mkdir(exist_ok=True)
for code in SERIES:
    url = "https://api.db.nomics.world/v22/series/" + code + "?observations=1"
    target = out / (code.replace("/", "__") + ".json")
    with urlopen(url, timeout=30) as response:
        target.write_bytes(response.read())
    print(target)
