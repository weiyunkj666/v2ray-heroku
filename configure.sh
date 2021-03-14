#!/bin/sh

# Download and install V2Ray
mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl

# Remove temporary directory
rm -rf /tmp/v2ray

# V2Ray new configuration
install -d /usr/local/etc/v2ray
cat << EOF > /usr/local/etc/v2ray/config.json
{
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",
                        "alterId": 64
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        },
	{
       "protocol": "vmess",	
	   "tag":"v2_out",
       "settings": 
           {
           "vnext": 
	        [{
                "address": "54.169.217.94",  
                "port": 50265,  
                "users": [{ "id": "7db08b3f-0dc8-4f36-b426-adbca8160217" }]
                }]
           }
     }
    ],
	"routing": {
		"domainStrategy": "IPOnDemand",
		"rules": [
			{
				"type": "field",
				"ip": [
					"0.0.0.0/8",
					"10.0.0.0/8",
					"100.64.0.0/10",
					"127.0.0.0/8",
					"169.254.0.0/16",
					"172.16.0.0/12",
					"192.0.0.0/24",
					"192.0.2.0/24",
					"192.168.0.0/16",
					"198.18.0.0/15",
					"198.51.100.0/24",
					"203.0.113.0/24",
					"::1/128",
					"fc00::/7",
					"fe80::/10"
				],
				"outboundTag": "blocked"
			},
			{
          "type": "field",
          "outboundTag": "v2_out",
          "domain": ["geosite:netflix"]
        },
			{
          "type": "field",
          "outboundTag": "v2_out",
		  "domain": ["geosite:category-porn"]
        },
			{
          "type": "field",
          "outboundTag": "v2_out",
		  "domain": ["geosite:pornhub"]
        },
			{
				"type": "field",
				"inboundTag": ["tg-in"],
				"outboundTag": "tg-out"
			}
			,
			{
				"type": "field",
				"domain": [
					"domain:0plkijj.vip",
					"domain:114av.xyz",
					"domain:16fhgdty.xyz",
					"domain:18novel.xyz",
					"domain:1jjdg2.vip",
					"domain:1jsa22.vip",
					"domain:1pondo.tv",
					"domain:51dh.site",
					"domain:520aa.tv",
					"domain:5278.cc",
					"domain:52hyse.com",
					"domain:54647.online",
					"domain:69story.com",
					"domain:69vj.com",
					"domain:721av.com",
					"domain:7mm.tv",
					"domain:85tube.com",
					"domain:91.51rmc.com",
					"domain:91porn.com",
					"domain:920share.com",
					"domain:a.91gay.me",
					"domain:a.kslive.tv",
					"domain:aavs.xyz",
					"domain:agzy1.com",
					"domain:aibaobei.me",
					"domain:aimei133.com",
					"domain:airav.cc",
					"domain:animezilla.com",
					"domain:asianpornmovies.com",
					"domain:av01.tv",
					"domain:av1688.cc",
					"domain:av6k.com",
					"domain:avfox.cc",
					"domain:avgle.com",
					"domain:avinin.com",
					"domain:avmoo.cyou",
					"domain:avn.com",
					"domain:avpanda.cc",
					"domain:avsee01.tv",
					"domain:avseesee.com",
					"domain:bangbros.com",
					"domain:beeg.com",
					"domain:besthentaitube.com",
					"domain:brazzers.com",
					"domain:buzzav.com",
					"domain:caime.xyz",
					"domain:calvappd.me",
					"domain:cam4.com",
					"domain:chaturbate.com",
					"domain:cslpldyb.me",
					"domain:dkk37.com",
					"domain:download.91porn005.me",
					"domain:download.i91av.org",
					"domain:dvh30n.vip",
					"domain:eporner.com",
					"domain:fanhaodian.com",
					"domain:flirt4free.com",
					"domain:follasian.com",
					"domain:gaypad.net",
					"domain:gouri.xyz",
					"domain:hanime.tv",
					"domain:hanime1.me",
					"domain:hegre.com",
					"domain:hpjav.tv",
					"domain:hqporner.com",
					"domain:hsxhr.cc",
					"domain:ichineseporn.com",
					"domain:iijav.com",
					"domain:immxd.com",
					"domain:isexlove.tw",
					"domain:isexomega.tw",
					"domain:jable.tv",
					"domain:japan-whores.com",
					"domain:japanesebeauties.net",
					"domain:jav.guru",
					"domain:jav01.cc",
					"domain:jav101.com",
					"domain:jav168.cc",
					"domain:jav321.com",
					"domain:javcc.cc",
					"domain:javcc.com",
					"domain:javdoe.com",
					"domain:javdove8.xyz",
					"domain:javfor.me",
					"domain:javfull.net",
					"domain:javhd.com",
					"domain:javhd.pro",
					"domain:javhd3x.com",
					"domain:javhdfree.net",
					"domain:javlibrary.com",
					"domain:javmost.com",
					"domain:javqd.com",
					"domain:javynow.com",
					"domain:jgg18.xyz",
					"domain:jiayoulu.com",
					"domain:jinnaju.com",
					"domain:jjdong7.com",
					"domain:johren.net",
					"domain:kindgirls.com",
					"domain:kissjav.com",
					"domain:kphimsex.net",
					"domain:love7.xyz",
					"domain:lp99.pw",
					"domain:lsnzxzy1.com",
					"domain:lubetube.com",
					"domain:lululu.one",
					"domain:manyvids.com",
					"domain:mdlf.xyz",
					"domain:myavfun.com",
					"domain:mydirtyhobby.com",
					"domain:myfreecams.com",
					"domain:nekoxxx.com",
					"domain:netflav.com",
					"domain:nhentai.net",
					"domain:ohyeah1080.com",
					"domain:onejav.com",
					"domain:osakamotion.net",
					"domain:p3.csgfnmdb.com",
					"domain:papalah.com",
					"domain:pigav.com",
					"domain:popjav.tv",
					"domain:pornbest.org",
					"domain:pornhd.com",
					"domain:porntea.com",
					"domain:press.vin",
					"domain:pyhapp.com",
					"domain:qingse.one",
					"domain:r18lu.com",
					"domain:realitykings.com",
					"domain:redtube.com",
					"domain:rule34.xxx",
					"domain:seqingx.com",
					"domain:seselah.com",
					"domain:sextop1.net",
					"domain:sexzy4.com",
					"domain:soirt4.fun",
					"domain:south-plus.net",
					"domain:spankbang.com",
					"domain:stripchat.com",
					"domain:sub147.com",
					"domain:swag.live",
					"domain:t66y.com",
					"domain:tbr.tangbr.net",
					"domain:theav.cc",
					"domain:theporndude.com",
					"domain:thisav.com",
					"domain:thtmod1.com",
					"domain:tkb008.xyz",
					"domain:tokyomotion.net",
					"domain:tssp.best",
					"domain:tube8.com",
					"domain:tubetubetube.com",
					"domain:upjav.cc",
					"domain:vaginacontest.com",
					"domain:vgg8.com",
					"domain:vjav.com",
					"domain:watchjavonline.com",
					"domain:wuso.me",
					"domain:wzmyg.com",
					"domain:x-art.com",
					"domain:x18r.com",
					"domain:x99av.com",
					"domain:xo104.com",
					"domain:xtube.com",
					"domain:youav.com",
					"domain:youporn.com"
				],
				"outboundTag": "v2_out"
			}			,
			{
				"type": "field",
				"domain": [
					"domain:epochtimes.com",
					"domain:epochtimes.com.tw",
					"domain:epochtimes.fr",
					"domain:epochtimes.de",
					"domain:epochtimes.jp",
					"domain:epochtimes.ru",
					"domain:epochtimes.co.il",
					"domain:epochtimes.co.kr",
					"domain:epochtimes-romania.com",
					"domain:erabaru.net",
					"domain:lagranepoca.com",
					"domain:theepochtimes.com",
					"domain:ntdtv.com",
					"domain:ntd.tv",
					"domain:ntdtv-dc.com",
					"domain:ntdtv.com.tw",
					"domain:minghui.org",
					"domain:renminbao.com",
					"domain:dafahao.com",
					"domain:dongtaiwang.com",
					"domain:falundafa.org",
					"domain:wujieliulan.com",
					"domain:ninecommentaries.com",
					"domain:shenyun.com"
				],
				"outboundTag": "blocked"
			}			,
        {
          "type": "field",
          "outboundTag": "IP4_out",
          "network": "udp,tcp"
        },
                {
                    "type": "field",
                    "protocol": [
                        "bittorrent"
                    ],
                    "outboundTag": "blocked"
                }
			//include_ban_ad
			//include_rules
			//
		]
	}
}
EOF

# Run V2Ray
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
