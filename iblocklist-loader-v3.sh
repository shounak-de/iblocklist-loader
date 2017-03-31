#!/bin/sh

# Generic iblocklist.com ipset loader for ipset v4 and v6
# Author: redhat27
# snbforums thread: https://www.snbforums.com/threads/iblocklist-com-generic-ipset-loader-for-ipset-v6-and-v4.37976/
# credits for v6 implementation: http://www.unix.com/shell-programming-and-scripting/233825-convert-ip-ranges-cidr-netblocks.html

# Available free lists from [https://www.iblocklist.com/lists] Format:
# -------List name-(General)--Maintainer--Download URL-------------------------------------------------------------------------
List001="Pedophiles           I-Blocklist http://list.iblocklist.com/?list=dufcxgnbjsdwmwctgfuj&fileformat=p2p&archiveformat=gz"
List002="level1               Bluetack    http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz"
List003="level2               Bluetack    http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=p2p&archiveformat=gz"
List004="level3               Bluetack    http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=p2p&archiveformat=gz"
List005="edu                  Bluetack    http://list.iblocklist.com/?list=imlmncgrkbnacgcwfjvh&fileformat=p2p&archiveformat=gz"
List006="rangetest            Bluetack    http://list.iblocklist.com/?list=plkehquoahljmyxjixpu&fileformat=p2p&archiveformat=gz"
List007="bogon                Bluetack    http://list.iblocklist.com/?list=gihxqmhyunbxhbmgqrla&fileformat=p2p&archiveformat=gz"
List008="ads                  Bluetack    http://list.iblocklist.com/?list=dgxtneitpuvgqqcpfulq&fileformat=p2p&archiveformat=gz"
List009="spyware              Bluetack    http://list.iblocklist.com/?list=llvtlsjyoyiczbkjsxpf&fileformat=p2p&archiveformat=gz"
List010="proxy                Bluetack    http://list.iblocklist.com/?list=xoebmbyexwuiogmbyprb&fileformat=p2p&archiveformat=gz"
List011="badpeers             Bluetack    http://list.iblocklist.com/?list=cwworuawihqvocglcoss&fileformat=p2p&archiveformat=gz"
List012="Microsoft            Bluetack    http://list.iblocklist.com/?list=xshktygkujudfnjfioro&fileformat=p2p&archiveformat=gz"
List013="spider               Bluetack    http://list.iblocklist.com/?list=mcvxsnihddgutbjfbghy&fileformat=p2p&archiveformat=gz"
List014="hijacked             Bluetack    http://list.iblocklist.com/?list=usrcshglbiilevmyfhse&fileformat=p2p&archiveformat=gz"
List015="dshield              Bluetack    http://list.iblocklist.com/?list=xpbqleszmajjesnzddhv&fileformat=p2p&archiveformat=gz"
List016="forumspam            Bluetack    http://list.iblocklist.com/?list=ficutxiwawokxlcyoeye&fileformat=p2p&archiveformat=gz"
List017="webexploit           Bluetack    http://list.iblocklist.com/?list=ghlzqtqxnzctvvajwwag&fileformat=p2p&archiveformat=gz"
List018="iana-reserved        Bluetack    http://list.iblocklist.com/?list=bcoepfyewziejvcqyhqo&fileformat=p2p&archiveformat=gz"
List019="iana-private         Bluetack    http://list.iblocklist.com/?list=cslpybexmxyuacbyuvib&fileformat=p2p&archiveformat=gz"
List020="iana-multicast       Bluetack    http://list.iblocklist.com/?list=pwqnlynprfgtjbgqoizj&fileformat=p2p&archiveformat=gz"
List021="fornonlancomputers   Bluetack    http://list.iblocklist.com/?list=jhaoawihmfxgnvmaqffp&fileformat=p2p&archiveformat=gz"
List022="exclusions           Bluetack    http://list.iblocklist.com/?list=mtxmiireqmjzazcsoiem&fileformat=p2p&archiveformat=gz"
List023="DROP                 Spamhaus    http://list.iblocklist.com/?list=zbdlwrqkabxbcppvrnos&fileformat=p2p&archiveformat=gz"
List024="ZeuS                 abuse       http://list.iblocklist.com/?list=ynkdjqsjyfmilsgbogqf&fileformat=p2p&archiveformat=gz"
List025="SpyEye               abuse       http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq&fileformat=p2p&archiveformat=gz"
List026="Palevo               abuse       http://list.iblocklist.com/?list=erqajhwrxiuvjxqrrwfj&fileformat=p2p&archiveformat=gz"
List027="Malicious            CI-Army     http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm&fileformat=p2p&archiveformat=gz"
List028="malc0de              malc0de     http://list.iblocklist.com/?list=pbqcylkejciyhmwttify&fileformat=p2p&archiveformat=gz"
List029="adservers            Yoyo        http://list.iblocklist.com/?list=zhogegszwduurnvsyhdf&fileformat=p2p&archiveformat=gz"
List030="bogon                cidr-report http://list.iblocklist.com/?list=lujdnbasfaaixitgmxpp&fileformat=p2p&archiveformat=gz"
List031="cruzit-web-attacks   CruzIT      http://list.iblocklist.com/?list=czvaehmjpsnwwttrdoyl&fileformat=p2p&archiveformat=gz"
List032="Business-ISPs        TBG         http://list.iblocklist.com/?list=jcjfaxgyyshvdbceroxf&fileformat=p2p&archiveformat=gz"
List033="Primary-Threats      TBG         http://list.iblocklist.com/?list=ijfqtofzixtwayqovmxn&fileformat=p2p&archiveformat=gz"
List034="Hijacked             TBG         http://list.iblocklist.com/?list=tbnuqfclfkemqivekikv&fileformat=p2p&archiveformat=gz"
List035="Bogon                TBG         http://list.iblocklist.com/?list=ewqglwibdgjttwttrinl&fileformat=p2p&archiveformat=gz"
List036="Search-Engines       TBG         http://list.iblocklist.com/?list=pfefqteoxlfzopecdtyw&fileformat=p2p&archiveformat=gz"
List037="Corporate-Ranges     TBG         http://list.iblocklist.com/?list=ecqbsykllnadihkdirsh&fileformat=p2p&archiveformat=gz"
# -------List name (Orgs)-----Maintainer--Download URL-------------------------------------------------------------------------
List038="TheOnionRouter       I-Blocklist http://list.iblocklist.com/?list=togdoptykrlolpddwbvz&fileformat=p2p&archiveformat=gz"
List039="Apple                I-Blocklist http://list.iblocklist.com/?list=aphcqvpxuqgrkgufjruj&fileformat=p2p&archiveformat=gz"
List040="LogMeIn              I-Blocklist http://list.iblocklist.com/?list=tgbankumtwtrzllndbmb&fileformat=p2p&archiveformat=gz"
List041="Steam                I-Blocklist http://list.iblocklist.com/?list=cnxkgiklecdaihzukrud&fileformat=p2p&archiveformat=gz"
List042="Xfire                I-Blocklist http://list.iblocklist.com/?list=ppqqnyihmcrryraaqsjo&fileformat=p2p&archiveformat=gz"
List043="Blizzard             I-Blocklist http://list.iblocklist.com/?list=ercbntshuthyykfkmhxc&fileformat=p2p&archiveformat=gz"
List044="Ubisoft              I-Blocklist http://list.iblocklist.com/?list=etmcrglomupyxtaebzht&fileformat=p2p&archiveformat=gz"
List045="Nintendo             I-Blocklist http://list.iblocklist.com/?list=pevkykuhgaegqyayzbnr&fileformat=p2p&archiveformat=gz"
List046="Activision           I-Blocklist http://list.iblocklist.com/?list=gfnxlhxsijzrcuxwzebb&fileformat=p2p&archiveformat=gz"
List047="SonyOnlineEnt        I-Blocklist http://list.iblocklist.com/?list=tukpvrvlubsputmkmiwg&fileformat=p2p&archiveformat=gz"
List048="CrowdControlProds    I-Blocklist http://list.iblocklist.com/?list=eveiyhgmusglurfmjyag&fileformat=p2p&archiveformat=gz"
List049="LindenLab            I-Blocklist http://list.iblocklist.com/?list=qnjdimxnaupjmpqolxcv&fileformat=p2p&archiveformat=gz"
List050="ElectronicArts       I-Blocklist http://list.iblocklist.com/?list=ejqebpcdmffinaetsvxj&fileformat=p2p&archiveformat=gz"
List051="SquareEnix           I-Blocklist http://list.iblocklist.com/?list=odyaqontcydnodrlyina&fileformat=p2p&archiveformat=gz"
List052="NCsoft               I-Blocklist http://list.iblocklist.com/?list=mwjuwmebrnzyyxpbezxu&fileformat=p2p&archiveformat=gz"
List053="RiotGames            I-Blocklist http://list.iblocklist.com/?list=sdlvfabdjvrdttfjotcy&fileformat=p2p&archiveformat=gz"
List054="PunkBuster           I-Blocklist http://list.iblocklist.com/?list=zvwwndvzulqcltsicwdg&fileformat=p2p&archiveformat=gz"
List055="Joost                I-Blocklist http://list.iblocklist.com/?list=alxugfmeszbhpxqfdits&fileformat=p2p&archiveformat=gz"
List056="Pandora              I-Blocklist http://list.iblocklist.com/?list=aevzidimyvwybzkletsg&fileformat=p2p&archiveformat=gz"
List057="ThePirateBay         I-Blocklist http://list.iblocklist.com/?list=nzldzlpkgrcncdomnttb&fileformat=p2p&archiveformat=gz"
# -------List name-(ISP)------Maintainer--Download URL----------[Note: Don't block your own ISP!]------------------------------
List058="AOL                  I-Blocklist http://list.iblocklist.com/?list=toboaiysofkflwgrttmb&fileformat=p2p&archiveformat=gz"
List059="Comcast              I-Blocklist http://list.iblocklist.com/?list=rsgyxvuklicibautguia&fileformat=p2p&archiveformat=gz"
List060="Cablevision          I-Blocklist http://list.iblocklist.com/?list=dwwbsmzirrykdlvpqozb&fileformat=p2p&archiveformat=gz"
List061="Verizon              I-Blocklist http://list.iblocklist.com/?list=cdmdbprvldivlqsaqjol&fileformat=p2p&archiveformat=gz"
List062="ATT                  I-Blocklist http://list.iblocklist.com/?list=grbtkzijgrowvobvessf&fileformat=p2p&archiveformat=gz"
List063="CoxCommunications    I-Blocklist http://list.iblocklist.com/?list=nlgdvmvfxvoimdunmuju&fileformat=p2p&archiveformat=gz"
List064="TimeWarnerCable      I-Blocklist http://list.iblocklist.com/?list=aqtsnttnqmcucwrjmohd&fileformat=p2p&archiveformat=gz"
List065="Charter              I-Blocklist http://list.iblocklist.com/?list=htnzojgossawhpkbulqw&fileformat=p2p&archiveformat=gz"
List066="Embarq               I-Blocklist http://list.iblocklist.com/?list=twdblifaysaqtypevvdp&fileformat=p2p&archiveformat=gz"
List067="Suddenlink           I-Blocklist http://list.iblocklist.com/?list=psaoblrwylfrdsspfuiq&fileformat=p2p&archiveformat=gz"
List068="Sprint               I-Blocklist http://list.iblocklist.com/?list=hngtqrhhuadlceqxbrob&fileformat=p2p&archiveformat=gz"
# -------List name-(Country)--Maintainer--Download URL-------------------------------------------------------
List069="Afghanistan          I-Blocklist http://list.iblocklist.com/?list=af&fileformat=p2p&archiveformat=gz"
List070="Aland-Islands        I-Blocklist http://list.iblocklist.com/?list=ax&fileformat=p2p&archiveformat=gz"
List071="Albania              I-Blocklist http://list.iblocklist.com/?list=al&fileformat=p2p&archiveformat=gz"
List072="Algeria              I-Blocklist http://list.iblocklist.com/?list=dz&fileformat=p2p&archiveformat=gz"
List073="American-Samoa       I-Blocklist http://list.iblocklist.com/?list=as&fileformat=p2p&archiveformat=gz"
List074="Andorra              I-Blocklist http://list.iblocklist.com/?list=ad&fileformat=p2p&archiveformat=gz"
List075="Angola               I-Blocklist http://list.iblocklist.com/?list=ao&fileformat=p2p&archiveformat=gz"
List076="Anguilla             I-Blocklist http://list.iblocklist.com/?list=ai&fileformat=p2p&archiveformat=gz"
List077="Antigua-and-Barbuda  I-Blocklist http://list.iblocklist.com/?list=ag&fileformat=p2p&archiveformat=gz"
List078="Argentina            I-Blocklist http://list.iblocklist.com/?list=ar&fileformat=p2p&archiveformat=gz"
List079="Armenia              I-Blocklist http://list.iblocklist.com/?list=am&fileformat=p2p&archiveformat=gz"
List080="Aruba                I-Blocklist http://list.iblocklist.com/?list=aw&fileformat=p2p&archiveformat=gz"
List081="Asia-Pas-Location    I-Blocklist http://list.iblocklist.com/?list=ap&fileformat=p2p&archiveformat=gz"
List082="Australia            I-Blocklist http://list.iblocklist.com/?list=au&fileformat=p2p&archiveformat=gz"
List083="Austria              I-Blocklist http://list.iblocklist.com/?list=at&fileformat=p2p&archiveformat=gz"
List084="Azerbaijan           I-Blocklist http://list.iblocklist.com/?list=az&fileformat=p2p&archiveformat=gz"
List085="Bahamas              I-Blocklist http://list.iblocklist.com/?list=bs&fileformat=p2p&archiveformat=gz"
List086="Bahrain              I-Blocklist http://list.iblocklist.com/?list=bh&fileformat=p2p&archiveformat=gz"
List087="Bangladesh           I-Blocklist http://list.iblocklist.com/?list=bd&fileformat=p2p&archiveformat=gz"
List088="Barbados             I-Blocklist http://list.iblocklist.com/?list=bb&fileformat=p2p&archiveformat=gz"
List089="Belarus              I-Blocklist http://list.iblocklist.com/?list=by&fileformat=p2p&archiveformat=gz"
List090="Belgium              I-Blocklist http://list.iblocklist.com/?list=be&fileformat=p2p&archiveformat=gz"
List091="Belize               I-Blocklist http://list.iblocklist.com/?list=bz&fileformat=p2p&archiveformat=gz"
List092="Benin                I-Blocklist http://list.iblocklist.com/?list=bj&fileformat=p2p&archiveformat=gz"
List093="Bermuda              I-Blocklist http://list.iblocklist.com/?list=bm&fileformat=p2p&archiveformat=gz"
List094="Bhutan               I-Blocklist http://list.iblocklist.com/?list=bt&fileformat=p2p&archiveformat=gz"
List095="Bolivia              I-Blocklist http://list.iblocklist.com/?list=bo&fileformat=p2p&archiveformat=gz"
List096="Bosnia-Herzegowina   I-Blocklist http://list.iblocklist.com/?list=ba&fileformat=p2p&archiveformat=gz"
List097="Botswana             I-Blocklist http://list.iblocklist.com/?list=bw&fileformat=p2p&archiveformat=gz"
List098="Brazil               I-Blocklist http://list.iblocklist.com/?list=br&fileformat=p2p&archiveformat=gz"
List099="Brunei-Darussalam    I-Blocklist http://list.iblocklist.com/?list=bn&fileformat=p2p&archiveformat=gz"
List100="Bulgaria             I-Blocklist http://list.iblocklist.com/?list=bg&fileformat=p2p&archiveformat=gz"
List101="Burkina-Faso         I-Blocklist http://list.iblocklist.com/?list=bf&fileformat=p2p&archiveformat=gz"
List102="Burundi              I-Blocklist http://list.iblocklist.com/?list=bi&fileformat=p2p&archiveformat=gz"
List103="Cambodia             I-Blocklist http://list.iblocklist.com/?list=kh&fileformat=p2p&archiveformat=gz"
List104="Cameroon             I-Blocklist http://list.iblocklist.com/?list=cm&fileformat=p2p&archiveformat=gz"
List105="Canada               I-Blocklist http://list.iblocklist.com/?list=ca&fileformat=p2p&archiveformat=gz"
List106="Cape-Verde           I-Blocklist http://list.iblocklist.com/?list=cv&fileformat=p2p&archiveformat=gz"
List107="Cayman-Islands       I-Blocklist http://list.iblocklist.com/?list=ky&fileformat=p2p&archiveformat=gz"
List108="Central-African-Rep  I-Blocklist http://list.iblocklist.com/?list=cf&fileformat=p2p&archiveformat=gz"
List109="Chile                I-Blocklist http://list.iblocklist.com/?list=cl&fileformat=p2p&archiveformat=gz"
List110="China                I-Blocklist http://list.iblocklist.com/?list=cn&fileformat=p2p&archiveformat=gz"
List111="Colombia             I-Blocklist http://list.iblocklist.com/?list=co&fileformat=p2p&archiveformat=gz"
List112="Congo                I-Blocklist http://list.iblocklist.com/?list=cd&fileformat=p2p&archiveformat=gz"
List113="Congo                I-Blocklist http://list.iblocklist.com/?list=cg&fileformat=p2p&archiveformat=gz"
List114="Cook-Islands         I-Blocklist http://list.iblocklist.com/?list=ck&fileformat=p2p&archiveformat=gz"
List115="Costa-Rica           I-Blocklist http://list.iblocklist.com/?list=cr&fileformat=p2p&archiveformat=gz"
List116="Cote-Divoire         I-Blocklist http://list.iblocklist.com/?list=ci&fileformat=p2p&archiveformat=gz"
List117="Croatia              I-Blocklist http://list.iblocklist.com/?list=hr&fileformat=p2p&archiveformat=gz"
List118="Cuba                 I-Blocklist http://list.iblocklist.com/?list=cu&fileformat=p2p&archiveformat=gz"
List119="Cyprus               I-Blocklist http://list.iblocklist.com/?list=cy&fileformat=p2p&archiveformat=gz"
List120="Czech-Republic       I-Blocklist http://list.iblocklist.com/?list=cz&fileformat=p2p&archiveformat=gz"
List121="Denmark              I-Blocklist http://list.iblocklist.com/?list=dk&fileformat=p2p&archiveformat=gz"
List122="Djibouti             I-Blocklist http://list.iblocklist.com/?list=dj&fileformat=p2p&archiveformat=gz"
List123="Dominican-Republic   I-Blocklist http://list.iblocklist.com/?list=do&fileformat=p2p&archiveformat=gz"
List124="Ecuador              I-Blocklist http://list.iblocklist.com/?list=ec&fileformat=p2p&archiveformat=gz"
List125="Egypt                I-Blocklist http://list.iblocklist.com/?list=eg&fileformat=p2p&archiveformat=gz"
List126="El-Salvador          I-Blocklist http://list.iblocklist.com/?list=sv&fileformat=p2p&archiveformat=gz"
List127="Equatorial-Guinea    I-Blocklist http://list.iblocklist.com/?list=gq&fileformat=p2p&archiveformat=gz"
List128="Eritrea              I-Blocklist http://list.iblocklist.com/?list=er&fileformat=p2p&archiveformat=gz"
List129="Estonia              I-Blocklist http://list.iblocklist.com/?list=ee&fileformat=p2p&archiveformat=gz"
List130="Ethiopia             I-Blocklist http://list.iblocklist.com/?list=et&fileformat=p2p&archiveformat=gz"
List131="European-Union       I-Blocklist http://list.iblocklist.com/?list=eu&fileformat=p2p&archiveformat=gz"
List132="Faroe-Islands        I-Blocklist http://list.iblocklist.com/?list=fo&fileformat=p2p&archiveformat=gz"
List133="Fiji                 I-Blocklist http://list.iblocklist.com/?list=fj&fileformat=p2p&archiveformat=gz"
List134="Finland              I-Blocklist http://list.iblocklist.com/?list=fi&fileformat=p2p&archiveformat=gz"
List135="France               I-Blocklist http://list.iblocklist.com/?list=fr&fileformat=p2p&archiveformat=gz"
List136="French-Guiana        I-Blocklist http://list.iblocklist.com/?list=gf&fileformat=p2p&archiveformat=gz"
List137="French-Polynesia     I-Blocklist http://list.iblocklist.com/?list=pf&fileformat=p2p&archiveformat=gz"
List138="Gabon                I-Blocklist http://list.iblocklist.com/?list=ga&fileformat=p2p&archiveformat=gz"
List139="Gambia               I-Blocklist http://list.iblocklist.com/?list=gm&fileformat=p2p&archiveformat=gz"
List140="Georgia              I-Blocklist http://list.iblocklist.com/?list=ge&fileformat=p2p&archiveformat=gz"
List141="Germany              I-Blocklist http://list.iblocklist.com/?list=de&fileformat=p2p&archiveformat=gz"
List142="Ghana                I-Blocklist http://list.iblocklist.com/?list=gh&fileformat=p2p&archiveformat=gz"
List143="Gibraltar            I-Blocklist http://list.iblocklist.com/?list=gi&fileformat=p2p&archiveformat=gz"
List144="Greece               I-Blocklist http://list.iblocklist.com/?list=gr&fileformat=p2p&archiveformat=gz"
List145="Greenland            I-Blocklist http://list.iblocklist.com/?list=gl&fileformat=p2p&archiveformat=gz"
List146="Grenada              I-Blocklist http://list.iblocklist.com/?list=gd&fileformat=p2p&archiveformat=gz"
List147="Guadeloupe           I-Blocklist http://list.iblocklist.com/?list=gp&fileformat=p2p&archiveformat=gz"
List148="Guam                 I-Blocklist http://list.iblocklist.com/?list=gu&fileformat=p2p&archiveformat=gz"
List149="Guatemala            I-Blocklist http://list.iblocklist.com/?list=gt&fileformat=p2p&archiveformat=gz"
List150="Guernsey             I-Blocklist http://list.iblocklist.com/?list=gg&fileformat=p2p&archiveformat=gz"
List151="Guinea               I-Blocklist http://list.iblocklist.com/?list=gn&fileformat=p2p&archiveformat=gz"
List152="Guinea-bissau        I-Blocklist http://list.iblocklist.com/?list=gw&fileformat=p2p&archiveformat=gz"
List153="Guyana               I-Blocklist http://list.iblocklist.com/?list=gy&fileformat=p2p&archiveformat=gz"
List154="Haiti                I-Blocklist http://list.iblocklist.com/?list=ht&fileformat=p2p&archiveformat=gz"
List155="Honduras             I-Blocklist http://list.iblocklist.com/?list=hn&fileformat=p2p&archiveformat=gz"
List156="Hong-Kong            I-Blocklist http://list.iblocklist.com/?list=hk&fileformat=p2p&archiveformat=gz"
List157="Hungary              I-Blocklist http://list.iblocklist.com/?list=hu&fileformat=p2p&archiveformat=gz"
List158="Iceland              I-Blocklist http://list.iblocklist.com/?list=is&fileformat=p2p&archiveformat=gz"
List159="India                I-Blocklist http://list.iblocklist.com/?list=in&fileformat=p2p&archiveformat=gz"
List160="Indian-Ocean         I-Blocklist http://list.iblocklist.com/?list=io&fileformat=p2p&archiveformat=gz"
List161="Indonesia            I-Blocklist http://list.iblocklist.com/?list=id&fileformat=p2p&archiveformat=gz"
List162="Iran                 I-Blocklist http://list.iblocklist.com/?list=ir&fileformat=p2p&archiveformat=gz"
List163="Iraq                 I-Blocklist http://list.iblocklist.com/?list=iq&fileformat=p2p&archiveformat=gz"
List164="Ireland              I-Blocklist http://list.iblocklist.com/?list=ie&fileformat=p2p&archiveformat=gz"
List165="Isle-of-Man          I-Blocklist http://list.iblocklist.com/?list=im&fileformat=p2p&archiveformat=gz"
List166="Israel               I-Blocklist http://list.iblocklist.com/?list=il&fileformat=p2p&archiveformat=gz"
List167="Italy                I-Blocklist http://list.iblocklist.com/?list=it&fileformat=p2p&archiveformat=gz"
List168="Jamaica              I-Blocklist http://list.iblocklist.com/?list=jm&fileformat=p2p&archiveformat=gz"
List169="Japan                I-Blocklist http://list.iblocklist.com/?list=jp&fileformat=p2p&archiveformat=gz"
List170="Jersey               I-Blocklist http://list.iblocklist.com/?list=je&fileformat=p2p&archiveformat=gz"
List171="Jordan               I-Blocklist http://list.iblocklist.com/?list=jo&fileformat=p2p&archiveformat=gz"
List172="Kazakhstan           I-Blocklist http://list.iblocklist.com/?list=kz&fileformat=p2p&archiveformat=gz"
List173="Kenya                I-Blocklist http://list.iblocklist.com/?list=ke&fileformat=p2p&archiveformat=gz"
List174="Kiribati             I-Blocklist http://list.iblocklist.com/?list=ki&fileformat=p2p&archiveformat=gz"
List175="Korea                I-Blocklist http://list.iblocklist.com/?list=kp&fileformat=p2p&archiveformat=gz"
List176="Kuwait               I-Blocklist http://list.iblocklist.com/?list=kw&fileformat=p2p&archiveformat=gz"
List177="Kyrgyzstan           I-Blocklist http://list.iblocklist.com/?list=kg&fileformat=p2p&archiveformat=gz"
List178="Lao                  I-Blocklist http://list.iblocklist.com/?list=la&fileformat=p2p&archiveformat=gz"
List179="Latvia               I-Blocklist http://list.iblocklist.com/?list=lv&fileformat=p2p&archiveformat=gz"
List180="Lebanon              I-Blocklist http://list.iblocklist.com/?list=lb&fileformat=p2p&archiveformat=gz"
List181="Lesotho              I-Blocklist http://list.iblocklist.com/?list=ls&fileformat=p2p&archiveformat=gz"
List182="Liberia              I-Blocklist http://list.iblocklist.com/?list=lr&fileformat=p2p&archiveformat=gz"
List183="Libya                I-Blocklist http://list.iblocklist.com/?list=ly&fileformat=p2p&archiveformat=gz"
List184="Liechtenstein        I-Blocklist http://list.iblocklist.com/?list=li&fileformat=p2p&archiveformat=gz"
List185="Lithuania            I-Blocklist http://list.iblocklist.com/?list=lt&fileformat=p2p&archiveformat=gz"
List186="Luxembourg           I-Blocklist http://list.iblocklist.com/?list=lu&fileformat=p2p&archiveformat=gz"
List187="Macau                I-Blocklist http://list.iblocklist.com/?list=mo&fileformat=p2p&archiveformat=gz"
List188="Macedonia            I-Blocklist http://list.iblocklist.com/?list=mk&fileformat=p2p&archiveformat=gz"
List189="Madagascar           I-Blocklist http://list.iblocklist.com/?list=mg&fileformat=p2p&archiveformat=gz"
List190="Malawi               I-Blocklist http://list.iblocklist.com/?list=mw&fileformat=p2p&archiveformat=gz"
List191="Malaysia             I-Blocklist http://list.iblocklist.com/?list=my&fileformat=p2p&archiveformat=gz"
List192="Maldives             I-Blocklist http://list.iblocklist.com/?list=mv&fileformat=p2p&archiveformat=gz"
List193="Mali                 I-Blocklist http://list.iblocklist.com/?list=ml&fileformat=p2p&archiveformat=gz"
List194="Malta                I-Blocklist http://list.iblocklist.com/?list=mt&fileformat=p2p&archiveformat=gz"
List195="Marshall-Islands     I-Blocklist http://list.iblocklist.com/?list=mh&fileformat=p2p&archiveformat=gz"
List196="Mauritania           I-Blocklist http://list.iblocklist.com/?list=mr&fileformat=p2p&archiveformat=gz"
List197="Mauritius            I-Blocklist http://list.iblocklist.com/?list=mu&fileformat=p2p&archiveformat=gz"
List198="Mexico               I-Blocklist http://list.iblocklist.com/?list=mx&fileformat=p2p&archiveformat=gz"
List199="Micronesia           I-Blocklist http://list.iblocklist.com/?list=fm&fileformat=p2p&archiveformat=gz"
List200="Moldova-Republic     I-Blocklist http://list.iblocklist.com/?list=md&fileformat=p2p&archiveformat=gz"
List201="Monaco               I-Blocklist http://list.iblocklist.com/?list=mc&fileformat=p2p&archiveformat=gz"
List202="Mongolia             I-Blocklist http://list.iblocklist.com/?list=mn&fileformat=p2p&archiveformat=gz"
List203="Montenegro           I-Blocklist http://list.iblocklist.com/?list=me&fileformat=p2p&archiveformat=gz"
List204="Montserrat           I-Blocklist http://list.iblocklist.com/?list=ms&fileformat=p2p&archiveformat=gz"
List205="Morocco              I-Blocklist http://list.iblocklist.com/?list=ma&fileformat=p2p&archiveformat=gz"
List206="Mozambique           I-Blocklist http://list.iblocklist.com/?list=mz&fileformat=p2p&archiveformat=gz"
List207="Myanmar              I-Blocklist http://list.iblocklist.com/?list=mm&fileformat=p2p&archiveformat=gz"
List208="Namibia              I-Blocklist http://list.iblocklist.com/?list=na&fileformat=p2p&archiveformat=gz"
List209="Nauru                I-Blocklist http://list.iblocklist.com/?list=nr&fileformat=p2p&archiveformat=gz"
List210="Nepal                I-Blocklist http://list.iblocklist.com/?list=np&fileformat=p2p&archiveformat=gz"
List211="Netherlands          I-Blocklist http://list.iblocklist.com/?list=nl&fileformat=p2p&archiveformat=gz"
List212="Netherlands-Antilles I-Blocklist http://list.iblocklist.com/?list=an&fileformat=p2p&archiveformat=gz"
List213="New-Caledonia        I-Blocklist http://list.iblocklist.com/?list=nc&fileformat=p2p&archiveformat=gz"
List214="New-Zealand          I-Blocklist http://list.iblocklist.com/?list=nz&fileformat=p2p&archiveformat=gz"
List215="Nicaragua            I-Blocklist http://list.iblocklist.com/?list=ni&fileformat=p2p&archiveformat=gz"
List216="Niger                I-Blocklist http://list.iblocklist.com/?list=ne&fileformat=p2p&archiveformat=gz"
List217="Nigeria              I-Blocklist http://list.iblocklist.com/?list=ng&fileformat=p2p&archiveformat=gz"
List218="Niue                 I-Blocklist http://list.iblocklist.com/?list=nu&fileformat=p2p&archiveformat=gz"
List219="Norfolk-Island       I-Blocklist http://list.iblocklist.com/?list=nf&fileformat=p2p&archiveformat=gz"
List220="Northern-Mariana     I-Blocklist http://list.iblocklist.com/?list=mp&fileformat=p2p&archiveformat=gz"
List221="Norway               I-Blocklist http://list.iblocklist.com/?list=no&fileformat=p2p&archiveformat=gz"
List222="Oman                 I-Blocklist http://list.iblocklist.com/?list=om&fileformat=p2p&archiveformat=gz"
List223="Pakistan             I-Blocklist http://list.iblocklist.com/?list=pk&fileformat=p2p&archiveformat=gz"
List224="Palau                I-Blocklist http://list.iblocklist.com/?list=pw&fileformat=p2p&archiveformat=gz"
List225="PalestinianTerritory I-Blocklist http://list.iblocklist.com/?list=ps&fileformat=p2p&archiveformat=gz"
List226="Panama               I-Blocklist http://list.iblocklist.com/?list=pa&fileformat=p2p&archiveformat=gz"
List227="Papua-New-Guinea     I-Blocklist http://list.iblocklist.com/?list=pg&fileformat=p2p&archiveformat=gz"
List228="Paraguay             I-Blocklist http://list.iblocklist.com/?list=py&fileformat=p2p&archiveformat=gz"
List229="Peru                 I-Blocklist http://list.iblocklist.com/?list=pe&fileformat=p2p&archiveformat=gz"
List230="Philippines          I-Blocklist http://list.iblocklist.com/?list=ph&fileformat=p2p&archiveformat=gz"
List231="Poland               I-Blocklist http://list.iblocklist.com/?list=pl&fileformat=p2p&archiveformat=gz"
List232="Portugal             I-Blocklist http://list.iblocklist.com/?list=pt&fileformat=p2p&archiveformat=gz"
List233="Puerto-Rico          I-Blocklist http://list.iblocklist.com/?list=pr&fileformat=p2p&archiveformat=gz"
List234="Qatar                I-Blocklist http://list.iblocklist.com/?list=qa&fileformat=p2p&archiveformat=gz"
List235="Republic-of-Korea    I-Blocklist http://list.iblocklist.com/?list=kr&fileformat=p2p&archiveformat=gz"
List236="Reunion              I-Blocklist http://list.iblocklist.com/?list=re&fileformat=p2p&archiveformat=gz"
List237="Romania              I-Blocklist http://list.iblocklist.com/?list=ro&fileformat=p2p&archiveformat=gz"
List238="Russia               I-Blocklist http://list.iblocklist.com/?list=ru&fileformat=p2p&archiveformat=gz"
List239="Rwanda               I-Blocklist http://list.iblocklist.com/?list=rw&fileformat=p2p&archiveformat=gz"
List240="Saint-Kitts-Nevis    I-Blocklist http://list.iblocklist.com/?list=kn&fileformat=p2p&archiveformat=gz"
List241="Saint-Lucia          I-Blocklist http://list.iblocklist.com/?list=lc&fileformat=p2p&archiveformat=gz"
List242="Saint-Martin         I-Blocklist http://list.iblocklist.com/?list=mf&fileformat=p2p&archiveformat=gz"
List243="Saint-Vincent        I-Blocklist http://list.iblocklist.com/?list=vc&fileformat=p2p&archiveformat=gz"
List244="Samoa                I-Blocklist http://list.iblocklist.com/?list=ws&fileformat=p2p&archiveformat=gz"
List245="San-Marino           I-Blocklist http://list.iblocklist.com/?list=sm&fileformat=p2p&archiveformat=gz"
List246="Saudi-Arabia         I-Blocklist http://list.iblocklist.com/?list=sa&fileformat=p2p&archiveformat=gz"
List247="Senegal              I-Blocklist http://list.iblocklist.com/?list=sn&fileformat=p2p&archiveformat=gz"
List248="Serbia               I-Blocklist http://list.iblocklist.com/?list=rs&fileformat=p2p&archiveformat=gz"
List249="Serbia-Montenegro    I-Blocklist http://list.iblocklist.com/?list=cs&fileformat=p2p&archiveformat=gz"
List250="Seychelles           I-Blocklist http://list.iblocklist.com/?list=sc&fileformat=p2p&archiveformat=gz"
List251="Sierra-Leone         I-Blocklist http://list.iblocklist.com/?list=sl&fileformat=p2p&archiveformat=gz"
List252="Singapore            I-Blocklist http://list.iblocklist.com/?list=sg&fileformat=p2p&archiveformat=gz"
List253="Slovakia             I-Blocklist http://list.iblocklist.com/?list=sk&fileformat=p2p&archiveformat=gz"
List254="Slovenia             I-Blocklist http://list.iblocklist.com/?list=si&fileformat=p2p&archiveformat=gz"
List255="Solomon-Islands      I-Blocklist http://list.iblocklist.com/?list=sb&fileformat=p2p&archiveformat=gz"
List256="South-Africa         I-Blocklist http://list.iblocklist.com/?list=za&fileformat=p2p&archiveformat=gz"
List257="Spain                I-Blocklist http://list.iblocklist.com/?list=es&fileformat=p2p&archiveformat=gz"
List258="Sri-Lanka            I-Blocklist http://list.iblocklist.com/?list=lk&fileformat=p2p&archiveformat=gz"
List259="St-Pierre-Miquelon   I-Blocklist http://list.iblocklist.com/?list=pm&fileformat=p2p&archiveformat=gz"
List260="Sudan                I-Blocklist http://list.iblocklist.com/?list=sd&fileformat=p2p&archiveformat=gz"
List261="Suriname             I-Blocklist http://list.iblocklist.com/?list=sr&fileformat=p2p&archiveformat=gz"
List262="Swaziland            I-Blocklist http://list.iblocklist.com/?list=sz&fileformat=p2p&archiveformat=gz"
List263="Sweden               I-Blocklist http://list.iblocklist.com/?list=se&fileformat=p2p&archiveformat=gz"
List264="Switzerland          I-Blocklist http://list.iblocklist.com/?list=ch&fileformat=p2p&archiveformat=gz"
List265="Syrian-Arab-Republic I-Blocklist http://list.iblocklist.com/?list=sy&fileformat=p2p&archiveformat=gz"
List266="Taiwan               I-Blocklist http://list.iblocklist.com/?list=tw&fileformat=p2p&archiveformat=gz"
List267="Tajikistan           I-Blocklist http://list.iblocklist.com/?list=tj&fileformat=p2p&archiveformat=gz"
List268="Tanzania             I-Blocklist http://list.iblocklist.com/?list=tz&fileformat=p2p&archiveformat=gz"
List269="Thailand             I-Blocklist http://list.iblocklist.com/?list=th&fileformat=p2p&archiveformat=gz"
List270="Timor-leste          I-Blocklist http://list.iblocklist.com/?list=tl&fileformat=p2p&archiveformat=gz"
List271="Togo                 I-Blocklist http://list.iblocklist.com/?list=tg&fileformat=p2p&archiveformat=gz"
List272="Tonga                I-Blocklist http://list.iblocklist.com/?list=to&fileformat=p2p&archiveformat=gz"
List273="Trinidad-and-Tobago  I-Blocklist http://list.iblocklist.com/?list=tt&fileformat=p2p&archiveformat=gz"
List274="Tunisia              I-Blocklist http://list.iblocklist.com/?list=tn&fileformat=p2p&archiveformat=gz"
List275="Turkey               I-Blocklist http://list.iblocklist.com/?list=tr&fileformat=p2p&archiveformat=gz"
List276="Turkmenistan         I-Blocklist http://list.iblocklist.com/?list=tm&fileformat=p2p&archiveformat=gz"
List277="Turks-and-Caicos     I-Blocklist http://list.iblocklist.com/?list=tc&fileformat=p2p&archiveformat=gz"
List278="Tuvalu               I-Blocklist http://list.iblocklist.com/?list=tv&fileformat=p2p&archiveformat=gz"
List279="Uganda               I-Blocklist http://list.iblocklist.com/?list=ug&fileformat=p2p&archiveformat=gz"
List280="Ukraine              I-Blocklist http://list.iblocklist.com/?list=ua&fileformat=p2p&archiveformat=gz"
List281="United-Arab-Emirates I-Blocklist http://list.iblocklist.com/?list=ae&fileformat=p2p&archiveformat=gz"
List282="United-Kingdom       I-Blocklist http://list.iblocklist.com/?list=gb&fileformat=p2p&archiveformat=gz"
List283="United-States        I-Blocklist http://list.iblocklist.com/?list=us&fileformat=p2p&archiveformat=gz"
List284="Uruguay              I-Blocklist http://list.iblocklist.com/?list=uy&fileformat=p2p&archiveformat=gz"
List285="Uzbekistan           I-Blocklist http://list.iblocklist.com/?list=uz&fileformat=p2p&archiveformat=gz"
List286="Vanuatu              I-Blocklist http://list.iblocklist.com/?list=vu&fileformat=p2p&archiveformat=gz"
List287="Vatican-City         I-Blocklist http://list.iblocklist.com/?list=va&fileformat=p2p&archiveformat=gz"
List288="Venezuela            I-Blocklist http://list.iblocklist.com/?list=ve&fileformat=p2p&archiveformat=gz"
List289="Vietnam              I-Blocklist http://list.iblocklist.com/?list=vn&fileformat=p2p&archiveformat=gz"
List290="Virgin-Islands-BR    I-Blocklist http://list.iblocklist.com/?list=vg&fileformat=p2p&archiveformat=gz"
List291="Virgin-Islands-US    I-Blocklist http://list.iblocklist.com/?list=vi&fileformat=p2p&archiveformat=gz"
List292="Wallis-and-Futuna    I-Blocklist http://list.iblocklist.com/?list=wf&fileformat=p2p&archiveformat=gz"
List293="Yemen                I-Blocklist http://list.iblocklist.com/?list=ye&fileformat=p2p&archiveformat=gz"
List294="Zambia               I-Blocklist http://list.iblocklist.com/?list=zm&fileformat=p2p&archiveformat=gz"
List295="Zimbabwe             I-Blocklist http://list.iblocklist.com/?list=zw&fileformat=p2p&archiveformat=gz"

# Block traffic from any of the above lists
BLOCKLIST_INDEXES="27 38 13 15" # Can be any combination of above list indexes, e.g "15 13", "1", "7 24 8 29 31" etc. [Example: PeerGuardian implementation would be "2 11"]
BLOCKLIST_TRAFFIC="src" # [src|dst|src,dst] Use [src] to block inbound traffic, [dst] to block outbound traffic and [src,dst] to block both traffic

# Allow traffic from any of the above lists 
ALLOWLIST_INDEXES="56 39" # Can be any combination of above list indexes, just like BLOCKLIST_INDEXES
ALLOWLIST_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to allow inbound traffic, [dst] to allow outbound traffic and [src,dst] to allow both traffic

# Your favorite domain blocked after your chosen blocklist(s) are active? You can (optionally) specify domains to whitelist in a local file
WHITELIST_DOMAINS_FILE="/jffs/ipset_lists/whitelist-domains.txt" # One line per domain, comments (starting with the '#' character) allowed, even inline comments
WHITELIST_DOMAINS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to allow inbound traffic, [dst] to allow outbound traffic and [src,dst] to allow both traffic

# You can also force some domains to be blacklisted in a local file (optional)
BLACKLIST_DOMAINS_FILE="/jffs/ipset_lists/blacklist-domains.txt" # One line per domain, comments (starting with the '#' character) allowed, even inline comments
BLACKLIST_DOMAINS_TRAFFIC="src,dst" # [src|dst|src,dst] Use [src] to block inbound traffic, [dst] to block outbound traffic and [src,dst] to block both traffic

################################## [[[ IMPORTANT ]]] ###################################
# Processing order of block list, allow list, whitelist domains and blacklist domains: #
# Network traffic be filtered in this order in iptables FORWARD chain:                 #
# [1] Traffic to/from blacklisted domains in the BLACKLIST_DOMAINS_FILE (if specified) #
# [2] Traffic to/from whitelisted domains in the WHITELIST_DOMAINS_FILE (if specified) #
# [3] Traffic to/from lists referenced in the ALLOWLIST_INDEXES (if specified)         #
# [4] Traffic to/from lists referenced in the BLOCKLIST_INDEXES (if specified)         #
# [5] Your existing iptables FORWARD rules.                                            #
########################################################################################

# Use locally cached ipset data or download on each run
USE_LOCAL_CACHE=Y # [Y|N]

# Re-download list data if locally saved files are older than this many days [Needed mostly for USE_LOCAL_CACHE=Y]
LISTS_SAVE_DAYS=10

# Use DROP or REJECT target for iptable rule. Briefly, for DROP, attacker (or IP being blocked) will get no response and timeout,
# and REJECT will send immediate response of destination-unreachable (Attacker will know your IP is actively rejecting requests)
# See: http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject and http://serverfault.com/questions/157375/reject-vs-drop-when-using-iptables
# or from our own RMerlin: https://www.snbforums.com/threads/ip-tables-confusion.30373/#post-237738
IPTABLES_BLOCK_TARGET=DROP # [DROP|REJECT]

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

GetSetDetails () {
  index=$1
  [ ${#index} -eq 1 ] && index="00${index}"
  [ ${#index} -eq 2 ] && index="0${index}"
  SetName=$(eval echo \$$(eval echo List${index}) | awk '{ print toupper(substr($2,1,1)) substr($2,2) toupper(substr($1,1,1)) substr($1,2) }')
  Url=$(eval echo \$$(eval echo List${index}) | awk '{ print $3 }')
  [ ! -s "$IPSET_LISTS_DIR/${SetName}.gz" -o -n "$(find $IPSET_LISTS_DIR/${SetName}.gz -mtime +$LISTS_SAVE_DAYS -print 2>/dev/null)" ] && wget -q -O $IPSET_LISTS_DIR/${SetName}.gz ${Url}
  [ "$USE_LOCAL_CACHE" = "Y" ] && GetCommand="cat $IPSET_LISTS_DIR/${SetName}.gz" || GetCommand="wget -q -O - ${Url}"
}

# Different routers got different iptables and ipset syntax, also ipset v6.x did away with iptreemap.
# That resulted in a totally different way of parsing the large IP ranges, (hash:ip cannot handle large sets of sometimes 8M+ IPs)
# For ipset v6.x, the script converts IP ranges to CIDR. It creates 2 sets: One for single IPs, and one for CIDRs.
# For ipset v4.x, the original implementaion of using iptreemap is retained.
case $(ipset -v | grep -o "v[4,6]") in
  v6)
  # Loading ipset modules
  lsmod | grep -q "xt_set" || \
  for module in ip_set ip_set_hash_net ip_set_hash_ip xt_set; do
    modprobe $module
  done;
  MATCH_SET='--match-set'; CREATE='create'; DESTROY='destroy'; ADD='add'; IPHASH='hash:ip'
  ipset destroy tIP 2>/dev/null; ipset destroy tNet 2>/dev/null # Recover if previous run aborted
  for processType in BLOCK ALLOW; do
    [ "$processType" = "BLOCK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    for index in $(eval echo \$$(eval echo ${processType}LIST_INDEXES)); do
      GetSetDetails $index
      # Create the sets if they do not exist
      $(ipset swap ${SetName}Single ${SetName}Single 2>&1 | grep -q "name does not exist") && ipset n ${SetName}Single hash:ip hashsize 2048 maxelem 1048576
      $(ipset swap ${SetName}CIDR ${SetName}CIDR 2>&1 | grep -q "name does not exist") && ipset n ${SetName}CIDR hash:net hashsize 4096 maxelem 4194304

      if ! $(iptables-save | grep -q ${SetName}) || [ "$USE_LOCAL_CACHE" = "N" ]; then
        logger -t Firewall "$0: Started processing ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list"
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
        logger -t Firewall "$0: Loaded ${SetName}Single $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName}Single | wc -l | awk '{print $1-6}') entries"
        logger -t Firewall "$0: Loaded ${SetName}CIDR $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName}CIDR | wc -l | awk '{print $1-6}') entries"
      else
        iptables -D FORWARD -m set --match-set ${SetName}Single $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
        iptables -D FORWARD -m set --match-set ${SetName}CIDR $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
        logger -t Firewall "$0: Skipped loading ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')lists as they are already loaded. To force reloading, set USE_LOCAL_CACHE=N"
      fi
      iptables -I FORWARD -m set --match-set ${SetName}Single $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
      iptables -I FORWARD -m set --match-set ${SetName}CIDR $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
    done
  done;;
  v4)
  # Loading ipset modules
  lsmod | grep -q "ipt_set" || \
  for module in ip_set ip_set_iptreemap ipt_set; do
    modprobe $module
  done;
  MATCH_SET='--set'; CREATE='--create'; DESTROY='--destroy'; ADD='--add'; IPHASH='iphash'
  ipset --destroy iBTmp 2>/dev/null # Recover if previous run aborted
  for processType in BLOCK ALLOW; do
    [ "$processType" = "BLOCK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    for index in $(eval echo \$$(eval echo ${processType}LIST_INDEXES)); do
      GetSetDetails $index
      # Create the set if it does not exist
      $(ipset --swap ${SetName} ${SetName} 2>&1 | grep -q "Unknown set") && ipset -N ${SetName} iptreemap

      if ! $(iptables-save | grep -q ${SetName}) || [ "$USE_LOCAL_CACHE" = "N" ]; then
        logger -t Firewall "$0: Started processing ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list"
        ( echo "-N iBTmp iptreemap"
          eval $GetCommand | gunzip | nice -n 15 sed -n '/0.0.0.0/d;s/^.*:/-A iBTmp /p'
          echo -e "COMMIT"
        ) | nice -n 15 ipset --restore
        ipset --swap iBTmp ${SetName}
        ipset --destroy iBTmp
        logger -t Firewall "$0: Loaded ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list with $(ipset -L ${SetName} | wc -l | awk '{print $1-6}') entries"
      else
        iptables -D FORWARD -m set --set ${SetName} $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
        logger -t Firewall "$0: Skipped loading ${SetName} $(echo $processType | tr '[A-Z]' '[a-z]')list as it's already loaded. To force reloading, set USE_LOCAL_CACHE=N"
      fi
      iptables -I FORWARD -m set --set ${SetName} $(eval echo \$$(eval echo ${processType}LIST_TRAFFIC)) -j $PROCESS_RULES_TARGET
    done
  done;;
  *)
  logger -t Firewall "$0: Unknown ipset version. Exiting."
  exit 1;;
esac
for domainsFile in BLACK WHITE; do
  if [ -s "$(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_FILE))" ]; then
    [ "$domainsFile" = "BLACK" ] && PROCESS_RULES_TARGET=$IPTABLES_BLOCK_TARGET || PROCESS_RULES_TARGET=ACCEPT
    IPSET_LIST="${domainsFile:0:1}$(echo ${domainsFile:1} | tr '[A-Z]' '[a-z]')listDomains"
    iptables-save | grep -q $IPSET_LIST && iptables -D FORWARD -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_TRAFFIC)) -j $PROCESS_RULES_TARGET
    ipset $DESTROY $IPSET_LIST &>/dev/null # Destroy *if* existing (It will exist if this script is run more than once, e.g. scheduled in cron)
    ipset $CREATE $IPSET_LIST $IPHASH
    [ $? -eq 0 ] && entryCount=0
    while read line; do
      if [ -n "${line%%#*}" ]; then
        for ip in $(nslookup ${line%%#*} | sed -n '/^$/,$ s/^A.*: //p' | cut -d' ' -f1 | grep -v ":"); do
          ipset $ADD $IPSET_LIST $ip
          [ $? -eq 0 ] && entryCount=$((entryCount+1))
        done
      fi
    done <$(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_FILE))
    logger -t Firewall "$0: Added $IPSET_LIST ($entryCount entries)"
    iptables-save | grep -q $IPSET_LIST || iptables -I FORWARD -m set $MATCH_SET $IPSET_LIST $(eval echo \$$(eval echo ${domainsFile}LIST_DOMAINS_TRAFFIC)) -j $PROCESS_RULES_TARGET
  fi
done
