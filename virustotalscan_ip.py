## AUTOMATIC SCAN IP ADDRESS THRU VIRUSTOTAL API
## BY MRFAEEZ
## INSPIRED FROM https://www.youtube.com/watch?v=68hHkSRaWZs
## if error, probably no results in database
## usage: python virustotalscan_ip.py <file.txt>

## WARNING! ONLY 4 REQUESTS/MIN FOR PUBLIC API ##

import requests
import sys

api_key = "<api-key>"
headers = {"accept": "application/json", "x-apikey": api_key}
url = "https://www.virustotal.com/api/v3/ip_addresses/"
contents = []
n = 0

# READ CONTENT IN FILE
with open(sys.argv[1], 'r') as f:
    for line in f:
        contents.append(line)
        n += 1

# START SCANNING WITH API
for j in range (0, n):
    r = requests.get(url + contents[j], headers=headers).json()

    # READ JSON RESULT FROM API
    dict_web = r["data"]["attributes"]["last_analysis_results"]
    tot_engine_c = 0
    tot_detect_c = 0
    result_eng = []
    count_harmless = 0

    for i in dict_web:
        tot_engine_c += 1
        if dict_web[i]["category"] == "malicious" or dict_web[i]["category"] == "suspicious":
            result_eng.append(dict_web[i]["result"])
            tot_detect_c += 1
    res = []
    for i in result_eng:
        if i not in res:
            res.append(i)
    result_eng = res
    
    #PRINT RESULT
    if tot_detect_c > 0:
        print("The IP " + contents[j].strip() + " is MALICIOUS and rated as "+ str(result_eng)[1:-1] + " on " + str(tot_detect_c) + " engines out of " + str(tot_detect_c) + " engines.")
    else:
        print("The IP " + contents[j].strip() + " is clean")
