# The telephony platform

## Terminology

| Term                | Description                                                                                          |
|---------------------|------------------------------------------------------------------------------------------------------|
| baseman             | Central server for managing base applications                                                        |
| base application    | Application managed by baseman, e.g. ttps, tlb, top, proxy                                           |
| configurator        | Distributes configuration to base applications                                                       |
| desktop app         | Desktop softphone application                                                                        |
| gateway             | Joins two different networks                                                                         |
| provisioning server | Configures a SIP client with e.g. IP address and a DNS server for looking up domain names            |
| SIP cluster         | Cluster of SIP proxies (resolved by clients via DNS SRV records)                                     |
| SIP pool            | Pool of SIP servers (to simplify load balancing)                                                     |
| SIP proxy           | Intermediate entity acting both server and client.<br>Plays a role in routing requests and responses |
| SIP registrar       | Location service managing SIP REGISTER information                                                   |
| SIP server          | Manages call sessions between multiple endpoints                                                     |
| tlb                 | Load balancer for SIP calls.<br>Determines how calls are routed through the telephony platform       |
| top                 | Tracks the real-time state of SIP calls                                                              |
| ttps                | Telavox provisioning server                                                                          |


## A bird's-eye view

The figure below visualizes the main components involved routing calls.

```
 <provisioning server>     <load balancer>
      +------+                 +-----+
      | ttps |           ------| tlb |-----
      +------+           |     +-----+    |
          |              |                |
          |              |                |
      ____|___           |           <SIP server>     <edge gateway>        __   _
     (_]----[_)    +-----------+        +-----+         +---------+       _(  )_( )_
       |.''.|------| sipproxy1 |--------| sip |---------| gateway |------(_ cloud  _)
       |'..'|      +-----------+        +-----+         +---------+        (_) (__)
       '----'                             | |
          |                               | |
          |     <sip.telavox.se>          | |
          |         +-----+               | |
          ----------| DNS |               | |
                    +-----+               | |
          SRV -> sipproxy1.telavox.se     | |
                                          | |
                                   -------- ----------
                                   |                 |
      +-------------+           +-----+         +----------+
      | desktop app |-----------| top |         | userdata | <SIP registrar>
      +-------------+           +-----+         +----------+

```
*Figure 1. Main call routing components*

## Proxies everywhere

Maybe you have heard the name "proxy" turn up here and there.

E.g. the `sipproxy1` sends traffic to the SIP server `sip42` (composed of
`proxy`) which in turn might relay the traffic to a gateway like `tdcproxy1`:

```
                          <SIP server>
         <proxy>          +---------+         <gateway>
      +-----------+       | [proxy] |       +-----------+
      | sipproxy1 |       |         |       | tdcproxy1 |
      +-----------+       |  sip42  |       +-----------+
                          +---------+
```
*Figure 2. Proxies everywhere*


* The `sipproxy1` is a third-party component ([Kamailio](https://www.kamailio.org))
used mainly for routing calls
* The `proxy`, which is a component of the SIP server (`sip42` in the figure
above), was initially created for the gateway. This mean that the `proxy` and
the gateway are built from the same project, i.e.
[Telavox/proxy](https://github.com/Telavox/proxy)
* The `tdcproxy1` is in this case the gateway to the TDC network.


## The SIP server

The SIP server is the central part in our IP media network. It handles the SIP
sessions between endpoints, the RTP media routing and the SIP registrar (the
registrar itself is located outside the SIP server).

The SIP server is made up of the following three main components/projects:
* `tproxy` (proxy project)
* `mediaserver`
* `scriptserver`

```
        +----------------------------------------+
   SIP  |    +--------+   AGI   +--------------+ |
 ------------| tproxy |---------| scriptserver | |
        |    +--------+         +--------------+ |
        |        | RPC                           |
   RTP  |  +-------------+                       |
 ----------| mediaserver |                       |
        |  +-------------+                       |
        +----------------------------------------+

```
*Figure 2. SIP server*


The `tproxy` is a PBX implementation which has replaced Asterisk. The
`mediaserver` manages the media streams used for audio and video.

## Call routing - the details

<img src="images/tvx-calling-ext.png" style="left;" />

*Figure 3. Call routing*


