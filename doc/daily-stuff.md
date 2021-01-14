# Stuff used on a daily basis


## Networking

### Who is using my port?
`sudo lsof -i -P -n | grep LISTEN | <port>`

### Capture all network traffic on eth1
`sudo tcpdump -i eth1 -s0 -vv -w eth1.pcap`


## Troubleshooting

### Tail a specific host on syslog
`tail -F /var/log/syslog | tailhost certhandler1`


