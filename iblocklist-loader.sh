#!/bin/sh

# Generic iblocklist.com ipset loader for ipset v4 and v6
# Author: redhat27
# snbforums thread: https://www.snbforums.com/threads/iblocklist-com-generic-ipset-loader-for-ipset-v6-and-v4.37976/
# credits for v6 implementation: http://www.unix.com/shell-programming-and-scripting/233825-convert-ip-ranges-cidr-netblocks.html

# Available free block lists from [https://www.iblocklist.com/lists] Format:
# Index------Blocklist name------Maintainer--Download URL-------------------------------------------------------------------------
BlockList01="Pedophiles          I-Blocklist http://list.iblocklist.com/?list=dufcxgnbjsdwmwctgfuj&fileformat=p2p&archiveformat=gz"
BlockList02="level1              Bluetack    http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz"
BlockList03="level2              Bluetack    http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=p2p&archiveformat=gz"
BlockList04="level3              Bluetack    http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=p2p&archiveformat=gz"
BlockList05="edu                 Bluetack    http://list.iblocklist.com/?list=imlmncgrkbnacgcwfjvh&fileformat=p2p&archiveformat=gz"
BlockList06="rangetest           Bluetack    http://list.iblocklist.com/?list=plkehquoahljmyxjixpu&fileformat=p2p&archiveformat=gz"
BlockList07="bogon               Bluetack    http://list.iblocklist.com/?list=gihxqmhyunbxhbmgqrla&fileformat=p2p&archiveformat=gz"
BlockList08="ads                 Bluetack    http://list.iblocklist.com/?list=dgxtneitpuvgqqcpfulq&fileformat=p2p&archiveformat=gz"
BlockList09="spyware             Bluetack    http://list.iblocklist.com/?list=llvtlsjyoyiczbkjsxpf&fileformat=p2p&archiveformat=gz"
BlockList10="proxy               Bluetack    http://list.iblocklist.com/?list=xoebmbyexwuiogmbyprb&fileformat=p2p&archiveformat=gz"
BlockList11="badpeers            Bluetack    http://list.iblocklist.com/?list=cwworuawihqvocglcoss&fileformat=p2p&archiveformat=gz"
BlockList12="Microsoft           Bluetack    http://list.iblocklist.com/?list=xshktygkujudfnjfioro&fileformat=p2p&archiveformat=gz"
BlockList13="spider              Bluetack    http://list.iblocklist.com/?list=mcvxsnihddgutbjfbghy&fileformat=p2p&archiveformat=gz"
BlockList14="hijacked            Bluetack    http://list.iblocklist.com/?list=usrcshglbiilevmyfhse&fileformat=p2p&archiveformat=gz"
BlockList15="dshield             Bluetack    http://list.iblocklist.com/?list=xpbqleszmajjesnzddhv&fileformat=p2p&archiveformat=gz"
BlockList16="forumspam           Bluetack    http://list.iblocklist.com/?list=ficutxiwawokxlcyoeye&fileformat=p2p&archiveformat=gz"
BlockList17="webexploit          Bluetack    http://list.iblocklist.com/?list=ghlzqtqxnzctvvajwwag&fileformat=p2p&archiveformat=gz"
BlockList18="iana-reserved       Bluetack    http://list.iblocklist.com/?list=bcoepfyewziejvcqyhqo&fileformat=p2p&archiveformat=gz"
BlockList19="iana-private        Bluetack    http://list.iblocklist.com/?list=cslpybexmxyuacbyuvib&fileformat=p2p&archiveformat=gz"
BlockList20="iana-multicast      Bluetack    http://list.iblocklist.com/?list=pwqnlynprfgtjbgqoizj&fileformat=p2p&archiveformat=gz"
BlockList21="fornonlancomputers  Bluetack    http://list.iblocklist.com/?list=jhaoawihmfxgnvmaqffp&fileformat=p2p&archiveformat=gz"
BlockList22="exclusions          Bluetack    http://list.iblocklist.com/?list=mtxmiireqmjzazcsoiem&fileformat=p2p&archiveformat=gz"
BlockList23="DROP                Spamhaus    http://list.iblocklist.com/?list=zbdlwrqkabxbcppvrnos&fileformat=p2p&archiveformat=gz"
BlockList24="ZeuS                abuse       http://list.iblocklist.com/?list=ynkdjqsjyfmilsgbogqf&fileformat=p2p&archiveformat=gz"
BlockList25="SpyEye              abuse       http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq&fileformat=p2p&archiveformat=gz"
BlockList26="Palevo              abuse       http://list.iblocklist.com/?list=erqajhwrxiuvjxqrrwfj&fileformat=p2p&archiveformat=gz"
BlockList27="Malicious           CI-Army     http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm&fileformat=p2p&archiveformat=gz"
BlockList28="malc0de             malc0de     http://list.iblocklist.com/?list=pbqcylkejciyhmwttify&fileformat=p2p&archiveformat=gz"
BlockList29="adservers           Yoyo        http://list.iblocklist.com/?list=zhogegszwduurnvsyhdf&fileformat=p2p&archiveformat=gz"
BlockList30="bogon               cidr-report http://list.iblocklist.com/?list=lujdnbasfaaixitgmxpp&fileformat=p2p&archiveformat=gz"
BlockList31="cruzit-web-attacks  CruzIT      http://list.iblocklist.com/?list=czvaehmjpsnwwttrdoyl&fileformat=p2p&archiveformat=gz"
BlockList32="Business-ISPs       TBG         http://list.iblocklist.com/?list=jcjfaxgyyshvdbceroxf&fileformat=p2p&archiveformat=gz"
BlockList33="Primary-Threats     TBG         http://list.iblocklist.com/?list=ijfqtofzixtwayqovmxn&fileformat=p2p&archiveformat=gz"
BlockList34="Hijacked            TBG         http://list.iblocklist.com/?list=tbnuqfclfkemqivekikv&fileformat=p2p&archiveformat=gz"
BlockList35="Bogon               TBG         http://list.iblocklist.com/?list=ewqglwibdgjttwttrinl&fileformat=p2p&archiveformat=gz"
BlockList36="Search-Engines      TBG         http://list.iblocklist.com/?list=pfefqteoxlfzopecdtyw&fileformat=p2p&archiveformat=gz"
BlockList37="Corporate-Ranges    TBG         http://list.iblocklist.com/?list=ecqbsykllnadihkdirsh&fileformat=p2p&archiveformat=gz"

BLOCKLIST_INDEXES="12 33 9" # Can be any combination of above list indexes, e.g "27 9", "1", "7 24 8 29 31" etc. [Example: PeerGuardian implementation would be "2 11"]

# Use locally cached ipset data or download on each run
USE_LOCAL_CACHE=Y # [Y|N]

# Re-download blocklist data if locally saved files are older than this many days [Needed mostly for USE_LOCAL_CACHE=Y]
BLOCKLISTS_SAVE_DAYS=10

# Use DROP or REJECT target for iptable rule. Briefly, for DROP, attacker (or IP being blocked) will get no response and timeout,
# and REJECT will send immediate response of destination-unreachable (Attacker will know your IP is actively rejecting requests)
# See: http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject and http://serverfault.com/questions/157375/reject-vs-drop-when-using-iptables
IPTABLES_RULE_TARGET=DROP # [DROP|REJECT]

# Folder to cache downloaded files [Needed for USE_LOCAL_CACHE=Y or storing the file for posterity]
IPSET_LISTS_DIR=/jffs/ipset_lists

# *** No settings to modify from here on down ***
[ -d "$IPSET_LISTS_DIR" ] || mkdir -p $IPSET_LISTS_DIR

# Wait if this is run early on (before the router has internet connectivity) [Needed by wget to download files]
while ! ping -q -c 1 google.com &>/dev/null; do
  sleep 1
  WaitSeconds=$((WaitSeconds+1))
  [ $WaitSeconds -gt 300 ] && logger -t Firewall "$0: Router not online: attempting to use cached files if they exist" && USE_LOCAL_CACHE=Y
done

# Different routers got different iptables and ipset syntax, also ipset v6.x did away with iptreemap.
# That resulted in a totally different way of parsing the large IP ranges, (hash:ip cannot handle large sets of sometimes 8M+ IPs)
# For ipset v6.x, the script converts IP ranges to CIDR. It creates 2 sets: One for single IPs, and one for CIDRs.
# For ipset v4.x, the original implementaion of using iptreemap is retained.
case $(ipset -v | grep -o "v[4,6]") in
  v6)
    # Loading ipset modules
    lsmod | grep -q "xt_set" || \
    for module in ip_set ip_set_nethash ip_set_iphash xt_set; do
      insmod $module
    done;
    ipset destroy tIP 2>/dev/null; ipset destroy tNet 2>/dev/null # Recover if previous run aborted
    for index in $BLOCKLIST_INDEXES; do
      [ ${#index} -eq 1 ] && index="0${index}"
      SetName=$(eval echo \$$(eval echo BlockList${index}) | awk '{ print toupper(substr($2,1,1)) substr($2,2) toupper(substr($1,1,1)) substr($1,2) }')
      Url=$(eval echo \$$(eval echo BlockList${index}) | awk '{ print $3 }')
      [ ! -s "$IPSET_LISTS_DIR/${SetName}.gz" -o -n "$(find $IPSET_LISTS_DIR/${SetName}.gz -mtime +$BLOCKLISTS_SAVE_DAYS -print 2>/dev/null)" ] && wget -q -O $IPSET_LISTS_DIR/${SetName}.gz ${Url}
      [ "$USE_LOCAL_CACHE" = "Y" ] && GetCommand="cat $IPSET_LISTS_DIR/${SetName}.gz" || GetCommand="wget -q -O - ${Url}"

      # Create the sets if they do not exist
      $(ipset swap ${SetName}Single ${SetName}Single 2>&1 | grep -q "name does not exist") && ipset n ${SetName}Single hash:ip hashsize 2048 maxelem 1048576
      $(ipset swap ${SetName}CIDR ${SetName}CIDR 2>&1 | grep -q "name does not exist") && ipset n ${SetName}CIDR hash:net hashsize 4096 maxelem 4194304

      logger -t Firewall "$0: Started processing ${SetName} blocklist"
      # Load the latest rules
      ( echo -e "n tIP -exist hash:ip hashsize 2048 maxelem 1048576\nn tNet -exist hash:net hashsize 4096 maxelem 4194304"
        eval $GetCommand | gunzip | sed -n '/0.0.0.0/d;s/^.*://p' | \
        nice -n 15 awk '
        # convert dotted quads to long decimal ip. Ex: int ip2dec("192.168.0.15")
        function ip2dec(ip, slice) {
          split(ip, slice, ".")
          return (slice[1] * 2^24) + (slice[2] * 2^16) + (slice[3] * 2^8) + slice[4]
        }
        # convert decimal long ip to dotted quads. Ex: str dec2ip(1171259392)
        function dec2ip(dec, ip, quad) {
          for (i=3; i>=1; i--) { quad = 256^i; ip = ip int(dec/quad) "."; dec = dec%quad }
          return ip dec
        }
        # convert ip ranges to CIDR notation. Ex: str range2cidr(ip2dec("192.168.0.15"), ip2dec("192.168.5.115"))
        function range2cidr(ipStart, ipEnd,  bits, mask, newip) {
          bits = 1; mask = 1
          while (bits < 32) {
            newip = or(ipStart, mask)
            if ((newip>ipEnd) || ((lshift(rshift(ipStart,bits),bits)) != ipStart)) { bits--; mask = rshift(mask,1); break }
            bits++; mask = lshift(mask,1)+1
          }
          newip = or(ipStart, mask); bits = 32 - bits
          # ipset cannot handle single IP via /32 [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=583079]
          if (bits==32) return "add tIP " dec2ip(ipStart)
          else result = dec2ip(ipStart) "/" bits
          if (newip < ipEnd) result = result "\n" range2cidr(newip + 1, ipEnd)
          return "add tNet " result
        }
        BEGIN { FS="-" }
        $1==$2 { print "add tIP " $1 }
        $1!=$2 { print range2cidr(ip2dec($1), ip2dec($2)) }
        '
      ) > /tmp/${SetName}.txt
      (grep " tIP " /tmp/${SetName}.txt; echo "COMMIT") | nice -n 15 ipset restore
      (grep " tNet " /tmp/${SetName}.txt; echo "COMMIT") | nice -n 15 ipset restore
      rm -f /tmp/${SetName}.txt
      ipset swap tIP ${SetName}Single
      ipset swap tNet ${SetName}CIDR
      ipset destroy tIP; ipset destroy tNet
      iptables-save | grep -q ${SetName}Single || iptables -I FORWARD -m set --match-set ${SetName}Single src,dst -j $IPTABLES_RULE_TARGET
      iptables-save | grep -q ${SetName}CIDR || iptables -I FORWARD -m set --match-set ${SetName}CIDR src,dst -j $IPTABLES_RULE_TARGET
      logger -t Firewall "$0: Loaded ${SetName}Single blocklist with $(ipset -L ${SetName}Single | wc -l | awk '{print $1-7}') entries"
      logger -t Firewall "$0: Loaded ${SetName}CIDR blocklist with $(ipset -L ${SetName}CIDR | wc -l | awk '{print $1-7}') entries"
    done;;
  v4)
    # Loading ipset modules
    lsmod | grep -q "ipt_set" || \
    for module in ip_set ip_set_iptreemap ipt_set; do
      insmod $module
    done;
    ipset --destroy iBTmp 2>/dev/null # Recover if previous run aborted
    for index in $BLOCKLIST_INDEXES; do
      [ ${#index} -eq 1 ] && index="0${index}"
      SetName=$(eval echo \$$(eval echo BlockList${index}) | awk '{ print toupper(substr($2,1,1)) substr($2,2) toupper(substr($1,1,1)) substr($1,2) }')
      Url=$(eval echo \$$(eval echo BlockList${index}) | awk '{ print $3 }')
      [ ! -s "$IPSET_LISTS_DIR/${SetName}.gz" -o -n "$(find $IPSET_LISTS_DIR/${SetName}.gz -mtime +$BLOCKLISTS_SAVE_DAYS -print 2>/dev/null)" ] && wget -q -O $IPSET_LISTS_DIR/${SetName}.gz ${Url}
      [ "$USE_LOCAL_CACHE" = "Y" ] && GetCommand="cat $IPSET_LISTS_DIR/${SetName}.gz" || GetCommand="wget -q -O - ${Url}"

      # Create the set if it does not exist
      $(ipset --swap ${SetName} ${SetName} 2>&1 | grep -q "Unknown set") && ipset -N ${SetName} iptreemap

      logger -t Firewall "$0: Started processing ${SetName} blocklist"
      # Load the latest rules
      ( echo "-N iBTmp iptreemap"
        eval $GetCommand | gunzip | nice -n 15 sed -n '/0.0.0.0/d;s/^.*:/-A iBTmp /p'
        echo -e "COMMIT"
      ) | nice -n 15 ipset --restore
      ipset --swap iBTmp ${SetName}
      ipset --destroy iBTmp
      iptables-save | grep -q ${SetName} || iptables -I FORWARD -m set --set ${SetName} src,dst -j $IPTABLES_RULE_TARGET
      logger -t Firewall "$0: Loaded ${SetName} blocklist with $(ipset -L ${SetName} | wc -l | awk '{print $1-6}') entries"
    done;;
  *)
    logger -t Firewall "$0: Unknown ipset version: $(ipset -v). Exiting."
    exit 1;;
esac
