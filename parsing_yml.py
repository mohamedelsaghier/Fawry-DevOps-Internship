#!/usr/bin/env python3
import yaml
with open('pod.yaml','r') as read_file:
    pod_info=yaml.safe_load(read_file)
    print(pod_info)
    print(1 * '\n')
    
    pod_info['spec']['containers'][0]['env'][0]['value']=['postrres://prod:5432']
    print(pod_info)

with open('output.yaml','w') as dump_file:
    yaml.dump(pod_info,dump_file)
