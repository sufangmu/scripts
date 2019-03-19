#!/usr/bin/env python3
import urllib.request
import json

top_level_url = "http://127.0.0.1:15672/api"
username = "admin"

password = "admin"

password_mgr = urllib.request.HTTPPasswordMgrWithDefaultRealm()
password_mgr.add_password(realm=None,
                          uri=top_level_url,
                          user=username,
                          passwd=password)
handler = urllib.request.HTTPBasicAuthHandler(password_mgr)

opener = urllib.request.build_opener(handler)

url = top_level_url+"/queues?columns=name,messages_ready,messages"
try:
    r = opener.open(url)
    result = r.read().decode("utf-8")
    result = json.loads(result)

    for queue in result:
        print("{} : {}".format(queue["name"], queue["messages_ready"]))
except Exception as e:
    print(e)

